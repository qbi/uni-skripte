<!-- $Id$ -->
<?php
include('header.php');

echo "<h1>Aktuelle �nderungen</h1>";

if (!$id) {
	echo '<ul>';
    	list_skripte("news.php");
        echo "</ul>\n";
} else {
	echo "<a href='./news.php'>Zur�ck zur �bersicht</a>
	  <h2>$id</h2>
	  <pre>", htmlentities(readfile("./$id.Changelog"), ENT_COMPAT, "UTF-8"),
	  "</pre>";
}

include('footer.php');
?>
