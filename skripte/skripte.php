<!-- $Id$ -->
<?php
include('header.php');
	
// set id, if not set in URL
if (!$id) {
	$id="SKRIPT";
	echo "<h1>Allgemeine Anleitung</h1>
	Im folgenden ist $id der Name eines der Projekte für das jeweilige
	Vorlesungsskript. Zur Zeit gibt es die folgenden:
	<ul><li>Maß und Integral, Prof. Dr. Hans-Jürgen Engelbert: engelbert-mass-integral</li>
	<li>Kommunikationssysteme, Prof. Dr. Werner Erhard: erhard-komm-sys</li>
	<li>Parallelität, Prof. Dr. Hans-Dietrich Hecker: hecker-parallel</li>
	<li>Formale Sprachen, Dr. Gerhard Lischke: lischke-form-sprachen</li>
	<li>Höhere Analysis, Prof. Dr. Hans-Jürgen Schmeißer: schmeisser-hoehere-ana</li>
	<li>Informatik 4, Dr. Jörg Vogel: vogel-info4</li>
	<li>Mathematik für Informatiker 3 (Wahrscheinlichkeitstheorie), Prof. Dr. Linde: linde-stochastik</li>
	<li>Das allgemeine Projekt für alle Skript: skripte</li></ul>";
} else {
	echo "<h1>Skript: $id</h1>";
}
echo "<p>Für die Kommandozeile: Eine aktuelle Version von SVN selbst ist unter
<a href=\"http://subversion.tigris.org/\">http://subversion.tigris.org/</a> verfügbar.</p>

Die erste lokale Kopie wird mit folgendem Befehl erstellt:
<pre>svn checkout svn+ssh://FRZ-Login@ppc214.mipool.uni-jena.de/home/stud/md01/joergs/.svnroot/$id</pre>

Später wird die lokale Kopie mit folgendem Befehl aktualisiert (in dem lokalen Verzeichnis $id):
<pre>svn update</pre>

Eigene Änderungen können mit dem folgenden Befehl auf den Server übertragen werden (in dem lokalen Verzeichnis $id):
<pre>svn commit</pre>";

if ($id=="SKRIPT") {
	echo "<p>Windowsanleitung unter:
	<a href='./windows.php'>
	http://www.minet.uni-jena.de/~joergs/skripte/windows.php</a></p>";
} else {
	echo "<p>Windowsanleitung unter:
	<a href='./windows.php?id=$id'>
	http://www.minet.uni-jena.de/~joergs/skripte/windows.php</a></p>
	
	<h2>Übersetzte Versionen</h2>
	<ul><li><a href='./pdf/$id.ps'>$id.ps</a></li>
	<li><a href='./pdf/$id.pdf'>$id.pdf</a></li></ul>
           
	<h2>Die aktuellen Quellen</h2>
	<ul><li><a href='./pdf/$id.tar.gz'>$id.tar.gz</a></li>
	";
}
echo "<p>Es sind alle recht herzlich eingeladen, an den Dokumenten mitzuarbeiten
und wenn es nur ist, die Fehler darin zu suchen oder Vorschläge zu
machen -- damit ist auch viel geholfen.</p>";

include('footer.php');
?>
