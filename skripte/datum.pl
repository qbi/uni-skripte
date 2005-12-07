#!/usr/bin/perl

use strict;

my $autor= `svnlook author /home/stud/md01/joergs/.svnroot/skripte/`;
my $datum = `svnlook date /home/stud/md01/joergs/.svnroot/skripte/`;

my $log;
open(FH,"<footer.php") or die $!;
while(<FH>){$log.=$_;}
close FH;

$log =~s/<!-- datum -->.*<!-- datum2 -->/<!-- datum -->$datum<!-- datum2 -->/;
$log =~s/<!-- autor -->.*<!-- autor2 -->/<!-- autor -->$autor<!-- autor2 -->/;

open(FH, ">footer.php") or die $!;
print FH $log;
close FH;


