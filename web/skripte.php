<!-- $Id$ -->
<?php
include('header.php');

// set id, if not set in URL
if (!$id) {
	$id="SKRIPT";
	echo "<h1>Allgemeine Anleitung</h1>
	Im Folgenden steht $id f&uuml;r den Namen eines der Projekte für das jeweilige
	Vorlesungsskript. Zur Zeit gibt es die folgenden:
	<ul>";
	list_skripte("skripte.php");
        echo "</ul>";
} else {
	echo "<h1>Skript: $id</h1>";
}
echo "<p>Für die Kommandozeile: Eine aktuelle Version von SVN selbst ist unter
<a href=\"http://subversion.tigris.org/\">http://subversion.tigris.org/</a> verfügbar.</p>

Die erste lokale Kopie wird mit folgendem Befehl erstellt
(<b><tt>FRZ-Login</tt> durch den Unix-Benutzernamen ersetzen!</b>):
<pre>svn checkout svn+ssh://FRZ-Login@ppc214.mipool.uni-jena.de/home/stud/md01/joergs/.svnroot/skripte/$id</pre>

Später wird die lokale Kopie mit folgendem Befehl aktualisiert (in dem lokalen Verzeichnis <tt>$id</tt>):
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
	http://www.minet.uni-jena.de/~joergs/skripte/windows.php</a></p>";

	echo "<h2>Übersetzte Versionen</h2>
	<ul>";
        $filename="$id.ps";
        if (file_exists($filename)) {
          echo "<li><a href='$filename'>$filename</a></li>";
        }
        $filename="$id.pdf";
        if (file_exists($filename)) {
          echo "<li><a href='$filename'>$filename</a></li>";
        }
        echo "</ul>";

	echo "<h2>Fehler im Skript gefunden?</h2>
              <p>Das Projekt lebt von der Mithilfe aller. Solltest du im Skript
               einen Fehler gefunden haben &ndash;&nbsp;egal ob Rechtschreib- oder
               Satzfehler oder einen inhaltlichen Fehler&nbsp;&ndash;, dann melde
               ihn uns. Ebenso sind wir an besseren Formulierungen und
               Ergänzungen interessiert.</p>

              <p>Bitte mach so viele Angaben wie möglich:
                <ul>
                  <li>Welche Ausgabe des Skripts ist es? Steht im Vorwort auf
                      Seite&nbsp;4.
                  <li>Auf welcher Seite ist der Fehler?
                  <li>Wo auf der Seite ist der Fehler? Oben, Mitte, unten?
                  <li>Was ist falsch?
                  <li>Gib auch 5&nbsp;Wörter vor und nach der Fehlerstelle an.
                  <li>Deine E-Mailadresse um Dich nochmal fragen zu können.
                </ul>
                <form method=\"post\" action=\"mail.php\">
                  <input type=\"hidden\" name=\"id\" value=\"$id\"/>
                  <textarea name=\"body\" cols=\"60\" rows=\"10\"></textarea>
                  <br>
                  <input type=\"submit\" name=\"knopf\" value=\"Verwerfen\"/>
                  <input type=\"submit\" name=\"knopf\" value=\"Absenden\"/>
                  <input type=\"submit\" name=\"knopf\" value=\"Verwerfen\"/>
                </form>
              </p>";

	echo "<h2>Die aktuellen Quellen</h2>";
        $filename="$id.tar.gz";
        if (file_exists($filename)) {
          echo "<ul><li><a href='$filename'>$filename</a></li></ul>";
        } else {
          echo "Leider noch keine Quellen verfügbar. Informationen gibt es
          unter <a href='mailto:skripte@listserv.uni-jena.de'>
          skripte@listserv.uni-jena.de</a>";
        }
}
echo "<p>Es sind alle recht herzlich eingeladen, an den Dokumenten mitzuarbeiten
und wenn es nur ist, die Fehler darin zu suchen oder Vorschläge zu
machen &ndash;&nbsp;damit ist auch viel geholfen!</p>";

if ($id != "SKRIPT" && file_exists("$id.Changelog"))
{
    echo "<h2>Letzte Änderungen</h2>\n<pre>",
      htmlentities(file_get_contents("$id.Changelog"), ENT_COMPAT, "UTF-8"),
      "</pre>\n";
}

include('footer.php');
?>
