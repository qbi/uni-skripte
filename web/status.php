<!-- $Id$ -->
<!--
<?php include('header.php'); ?>
-->

<table>
  <tr>
    <th align="left">Name</th>
    <th align="center">Fehler</th>
    <th align="center">Warnungen</th>
    <th align="center">TeX-Fehler</th>
    <th align="center">TeX-Warnungen</th>
    <th align="center">TeX-Boxen</th>
    <th align="center">TeX-Referenzen</th>
  </tr>
<!--
<?php

$lines = array_map('rtrim', file('./available_skripte'));
sort($lines);

foreach ($lines as $line)
{
    echo "  <tr>\n";

    $skript = preg_split("/\t+/", $line);
    $skript = $skript[0];
    echo "    <td><a href=\"./$skript.Build.log\">$skript</a></td>\n";

    if ( !file_exists("./$skript.Build.log") )
    {
        echo "    <td colspan=7 class='bad_stat'>Kein Log vorhanden</td>\n  </tr>\n";
        continue;
    }

    $blog = file("./$skript.Build.log");
    // echo "<!--".implode("--", $blog)."-->\n";

    foreach (array('F', 'W') as $j)
    {
        $func = create_function('$sum, $str',
                        "return \$sum + (strncmp(\$str, '$j: ', 3) == 0);");
        $val = array_reduce($blog, $func, 0);
        echo '    <td align=center class='.($val == 0?good:bad).
          "_stat>$val</td>\n";
    }

    /* Dieses merkwürdig anmutende Konstrukt sucht nach der ersten Zeile, die
     * mit "I: Zusammenfassung: " beginnt. */
    $func = create_function('$ret, $line', 'return strlen($ret) > 0 && '.
                            'strncmp($line, \'I: Zusammenfassung: \', 20) == 0 ?'.
                            '$line : $ret;');
    $tex_line = array_reduce($blog, $func, "");
    // echo "<!--".rtrim($tex_line)."-->\n";
    if (preg_match_all('/\\d+/', $tex_line, $matches) == 4)
      echo '    <td align=center>'.
           implode("</td>\n    <td align=center>", $matches[0])."</td>\n";
    else
      echo "    <td colspan=5 class='bad_stat'>Keine TeX-Zeile gefunden.</td>\n";

    echo "  </tr>\n";
}
?>
-->
</table>

<!--
include('footer.php');
?>
-->
