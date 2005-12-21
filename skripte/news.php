<!-- $Id$ -->
<?php
include('header.php');
	
echo "<h1>Aktuelle Änderungen</h1>";

if (!$id) {	
	echo "<ul><li><a href='./news.php?id=skripte'>Webseite</a></li>
	<li><a href='./news.php?id=carl-ana1'>Analysis 1</a></li>
	<li><a href='./news.php?id=carl-ana2'>Analysis 2</a></li>
	<li><a href='./news.php?id=schmeisser-ana3'>Analysis 3</a></li>
	<li><a href='./news.php?id=engelbert-mass-integral'>Maß und Integral</a></li>
	<li><a href='./news.php?id=erhard-komm-sys'>Kommunikationssysteme</a></li>
	<li><a href='./news.php?id=fichtner-ewms'>EWMS</a></li>
	<li><a href='./news.php?id=hecker-parallel'>Parallelität</a></li>
	<li><a href='./news.php?id=lischke-form-sprachen'>Formale Sprachen</a></li>
	<li><a href='./news.php?id=schmeisser-hoehere-ana'>H&ouml;here Analysis</a></li>
	<li><a href='./news.php?id=vogel-dml2'>DML 2</a></li>
	<li><a href='./news.php?id=vogel-info4'>Informatik 4</a></li>
	<li><a href='./news.php?id=linde-stochastik'>Mathematik für Informatiker&nbsp;3</a></li>
	<li><a href='./news.php?id=fey-recharch'>Rechnerarchitektur 1&nbsp;und&nbsp;2</></li></ul>";
} else {
	echo "<a href='./news.php'>Zurück zur Übersicht</a>
	<h2>$id</h2>
	<pre>";
	//echo (htmlentities(readfile("./$id.Changelog")));
	$datei=fopen("./$id.Changelog",r);
	while ($zeile=fgets($datei,1024))
	{
		echo ( htmlentities($zeile) );
	}
	fclose($datei);
	echo "</pre>";
}

include('footer.php');
?>
