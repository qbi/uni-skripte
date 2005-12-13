<!-- $Id$ -->
<?php
include('header.php');
	
// set id, if not set in URL
if (!$id) {
	$id="SKRIPT";
	echo "<h1>Allgemeine Anleitung</h1>
	Im folgenden ist $id der Name eines der Projekte f�r das jeweilige
	Vorlesungsskript. Zur Zeit gibt es die folgenden:
	<ul><li>Ma� und Integral, Prof. Dr. Hans-J�rgen Engelbert: engelbert-mass-integral</li>
	<li>Kommunikationssysteme, Prof. Dr. Werner Erhard: erhard-komm-sys</li>
	<li>Parallelit�t, Prof. Dr. Hans-Dietrich Hecker: hecker-parallel</li>
	<li>Formale Sprachen, Dr. Gerhard Lischke: lischke-form-sprachen</li>
	<li>H�here Analysis, Prof. Dr. Hans-J�rgen Schmei�er: schmeisser-hoehere-ana</li>
	<li>Informatik 4, Dr. J�rg Vogel: vogel-info4</li>
	<li>Mathematik f�r Informatiker 3 (Wahrscheinlichkeitstheorie), Prof. Dr. Linde: linde-stochastik</li>
	<li>Rechnerarchitektur 1&nbsp;und&nbsp;2, Prof. Dr. Fey: fey-recharch</li>
	<li>Das allgemeine Projekt f�r alle Skript: skripte</li></ul>";
} else {
	echo "<h1>Skript: $id</h1>";
}
echo "<p>F�r die Kommandozeile: Eine aktuelle Version von SVN selbst ist unter
<a href=\"http://subversion.tigris.org/\">http://subversion.tigris.org/</a> verf�gbar.</p>

Die erste lokale Kopie wird mit folgendem Befehl erstellt:
<pre>svn checkout svn+ssh://FRZ-Login@ppc214.mipool.uni-jena.de/home/stud/md01/joergs/.svnroot/$id</pre>

Sp�ter wird die lokale Kopie mit folgendem Befehl aktualisiert (in dem lokalen Verzeichnis $id):
<pre>svn update</pre>

Eigene �nderungen k�nnen mit dem folgenden Befehl auf den Server �bertragen werden (in dem lokalen Verzeichnis $id):
<pre>svn commit</pre>";

if ($id=="SKRIPT") {
	echo "<p>Windowsanleitung unter:
	<a href='./windows.php'>
	http://www.minet.uni-jena.de/~joergs/skripte/windows.php</a></p>";
} else {
	echo "<p>Windowsanleitung unter:
	<a href='./windows.php?id=$id'>
	http://www.minet.uni-jena.de/~joergs/skripte/windows.php</a></p>
	
	<h2>�bersetzte Versionen</h2>
	<ul>";
        $filename="./pdf/$id.ps";
        if (file_exists($filename)) {
          echo "<li><a href='$filename'>$filename</a></li>";
        }
        $filename="./pdf/$id.pdf";
        if (file_exists($filename)) {
          echo "<li><a href='$filename'>$filename</a></li>";
        }
        echo "</ul>
           
	<h2>Die aktuellen Quellen</h2>";
        $filename="./pdf/$id.tar.gz";
        if (file_exists($filename)) {
          echo "<ul><li><a href='$filename'>$filename</a></li></ul>";
        } else {
          echo "Leider noch keine Quellen verf�gbar. Informationen gibt es
          unter <a href='mailto:skripte@listserv.uni-jena.de'>
          skripte@listserv.uni-jena.de</>";
        }	
}
echo "<p>Es sind alle recht herzlich eingeladen, an den Dokumenten mitzuarbeiten
und wenn es nur ist, die Fehler darin zu suchen oder Vorschl�ge zu
machen -- damit ist auch viel geholfen.</p>";

include('footer.php');
?>
