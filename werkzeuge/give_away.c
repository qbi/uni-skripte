/*
 * Copyright (c)
 *       2007  Jörg Sommer <joerg@alea.gnuu.de>
 *
 * $Id$
 * 
 * Description: Mit diesem Programm lässt sich der Eigentümer einer Datei
 *              ändern. Wenn für das Programm das suid-Bit gesetzt ist, wird
 *              eine Kopie der Datei erstellt, welche dem Eigentümer des
 *              Programms gehört. Diese ersetzt dann die alte Datei.
 * 
 *              Das Programm ist also ein cp $DATEI $DATEI mit einigen
 *              Sicherheitsvorkehrungen und soll dazu verwendet werden,
 *              Dateien zwischen Benutzern zu übertragen, um z. B. gezielt
 *              das Quota eines bestimmen Benutzers zu belasten.
 *
 * License: This program is free software; you can redistribute it and/or
 * 	    modify it under the terms of the GNU General Public License as
 *	    published by the Free Software Foundation; either version 2 of
 *	    the License, or (at your option) any later version.
 *
 *          This program is distributed in the hope that it will be
 *	    useful, but WITHOUT ANY WARRANTY; without even the implied
 *	    warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
 *	    PURPOSE.  See the GNU General Public License for more details.
 */

#include <errno.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char* argv[])
{
    if (argc <= 1)
    {
        fprintf(stderr, "Usage: %s filename ...\n", argv[0]);
        return EXIT_FAILURE;
    }

    const size_t MEM_SIZE = getpagesize();
    const uid_t SRC_OWNER = getuid(), TARGET_OWNER = geteuid();

    for (int i = 1; i < argc; ++i)
    {
        const char* const in_file = argv[i];
        if (strncmp(in_file, "/home/stud/md01/joergs/", 23) != 0)
        {
            fprintf(stderr, "%s: Changing files outside of ~joergs "
                    "is prohibited\n", in_file);
            continue;
        }

        struct stat in_stat;
        if (stat(in_file, &in_stat) == -1)
        {
            perror("stat");
            continue;
        }

        if (in_stat.st_uid == TARGET_OWNER)
          /* There's nothing to do, because the target owner still owns
           * the file. */
          continue;

        if (seteuid(SRC_OWNER) == -1)
        {
            perror("seteuid src_owner");
            continue;
        }

        const int in_fd = open(in_file, O_RDONLY);
        if (in_fd == -1)
        {
            fprintf(stderr, "Opening file \"%s\" failed: %s\n", in_file,
                    strerror(errno));
            continue;
        }

        if (seteuid(TARGET_OWNER) == -1)
        {
            perror("seteuid target_owner");
            close(in_fd);
            continue;
        }

        /* Create a new file name by appending a dash */
        const size_t len = strlen(in_file);
        char* const out_file = alloca(len + 2);
        strcpy(out_file, in_file);
        strcpy(out_file + len, "-");

        /* Create the output file with the same permissions as the input file,
         * but clear the suid bit. */
        const int out_fd = open(out_file, O_WRONLY | O_CREAT | O_EXCL,
                                in_stat.st_mode & ~S_ISUID);
        if (out_fd == -1)
        {
            fprintf(stderr, "Opening file \"%s\" failed: %s\n", out_file,
                    strerror(errno));
            close(in_fd);
            continue;
        }

        const off_t FILE_SIZE = in_stat.st_size;

        off_t offset = 0;
        while (offset < FILE_SIZE)
        {
            char *mem = mmap(NULL, MEM_SIZE, PROT_READ, MAP_SHARED, in_fd,
                             offset);
            if (mem == MAP_FAILED)
            {
                perror("mmap failed");
                close(out_fd);
                close(in_fd);
                unlink(out_file);
                goto next_file;
            }
            offset += MEM_SIZE;

            write(out_fd, mem,
                  MEM_SIZE + (offset >= FILE_SIZE? FILE_SIZE - offset : 0) );

            munmap(mem, MEM_SIZE);
        }

        close(out_fd);
        close(in_fd);

        seteuid(SRC_OWNER);
        if (rename(out_file, in_file) == 0)
          seteuid(TARGET_OWNER);
        else
        {
            if (errno == EPERM || errno == EACCES)
            {
                if (unlink(in_file) == 0)
                {
                    seteuid(TARGET_OWNER);
                    rename(out_file, in_file);
                }
                else
                  seteuid(TARGET_OWNER);
            }
            else
            {
                fprintf(stderr, "Renaming file \"%s\" failed: %s\n", out_file,
                        strerror(errno));
                seteuid(TARGET_OWNER);
                unlink(out_file);
            }
        }
next_file:
        ;
    }

    return EXIT_SUCCESS;
}
