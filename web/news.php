<!-- $Id$ -->
<?php
include('header.php');

echo "<h1>Aktuelle Änderungen</h1>";

if (!$id) {
	echo '<ul>';
    	list_skripte("news.php");
        echo "</ul>\n";
} else {
	echo "<a href='./news.php'>Zurück zur Übersicht</a>
	  <h2>$id</h2>
	  <pre>", htmlentities(file_get_contents("$id.Changelog"), ENT_COMPAT, "UTF-8"),
	  "</pre>";
}

include('footer.php');
?>
