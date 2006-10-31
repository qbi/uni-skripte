<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' "http://www.w3.org/TR/html4/loose.dtd">
<!-- $Id$ -->

<?php
function map_line($line)
{
    $dash_pos = strpos($line, '-');
    $tab_pos = strpos($line, "\t");
    return substr($line, $dash_pos+1, $tab_pos-1-$dash_pos) . '-' .
      substr($line, 0, $dash_pos);
}

function list_skripte($link)
{
	$lines = array_map('rtrim', file('./available_skripte'));
	$lines = array_combine(array_map('map_line', $lines), $lines);
	ksort($lines);
    	$lines = array("web\tWebseite") + $lines;
	foreach ($lines as $line)
	{
		$fields = preg_split("/\t+/", $line);
		echo '<li>';
		if (count($fields) >= 2)
		{
			echo $fields[1];
			if (count($fields) == 3)
				echo ', ', $fields[2];
			echo ': ';
                }
            	if ( !empty($link) )
			echo '<a href="', $link, '?id=', $fields[0], '">';
            	echo $fields[0];
            	if ( !empty($link) )
                     echo '</a>';
            	echo "</li>\n";
	}
}
?>

<html>

  <head>
    <title>Vorlesungsskripte der Fakultät für Mathematik und Informatik

    </title>
    <link rel='stylesheet' href='./skripte.css'
	  type='text/css'>
    <meta name='description'
	  content='Vorlesungsskripte der Fakultät für Mathematik und Informatik'>
  </head>

  <body>

    <h1 id='logo'><a href='./'><img alt='Logo' border='0' src='./images/logo.png'/></a></h1>
    <h3 id='slogan'><em>...by students for students...</em></h3>

    <table border='0' cellspacing='0' cellpadding='10' width='100%'>

	<tr>

	  <td class='navbar' valign='top' width='20%'>

	    <div class='navheading'>
	      <a href='./'>Startseite</a>
	    </div>

	    <div class='navheading'>
	      <a href='./'>&Uuml;ber</a>
	    </div>

	    <div class='navheading'>
	      <a href='./news.php'>Aktuelles</a>
	    </div>

	    <div class='navheading'>
              Skripte

	    <?php
	      $lines = array_map('rtrim', file('./available_skripte'));
	      $lines = array_combine(array_map('map_line', $lines), $lines);
	      ksort($lines);
              foreach ($lines as $line)
              {
                  $fields = preg_split("/\t+/", $line);
                echo "<div class=\"navmenu\"><a href=\"./skripte.php?id=",
                  $fields[0], "\">";
                if (count($fields) >= 2)
                  echo $fields[1];
                else
                  echo $fields[0];
                echo "</a></div>\n";
              }
            ?>
	</div>

	<div class='navheading'>
	      Download

	    <div class='navmenu'>
	      <div><a href='./skripte.php'>Quellcode</a></div>
	    <!--  <div><a href='./pdf/'>PDFs</a></div> -->
	    </div>
	    </div>

	    <!--<div class='navheading'>
	      <a href='./mitarbeit.php'>Mitarbeit</a>
	    </div>-->

	    <div class='navheading'>
	      <a href='./mailingliste.php'>Mailingliste</a>
            </div>

	    <div class='navheading'>
	      Dokumentation

	    <div class='navmenu'>
	      <div><a href='./windows.php'>SVN Anleitung f&uuml;r Windows</a></div>
	      <div><a href='./skripte.php'>SVN Anleitung allgemein</a></div>
	      <div><a href='./form.php'>Hinweise zur Form</a></div>
	    </div>
	    </div>

	    <!--<div class='navheading'>
	    Probleme

	    <div class='navmenu'>
	      <div><a href='./diag.php'>Diagnose</a></div>
	      <div><a href='./bugs.php'>Fehler</a></div>
	    </div>
	    </div>-->

	    <div class='navheading'>
	      <a href='./links.php'>Links</a>
            </div>

	    <div class='navheading'>
	      <a href='./kontakt.php'>Kontakt</a>
	    </div>

	  </td>

	  <td rowspan='1' colspan='1' align='left' valign='top'>
