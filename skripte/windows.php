<!-- $Id$ -->
<?php
include('header.php');

if (!$id) {
	echo "<h1>Allgemeine Windowsanleitung</h1>
	Im folgenden ist SKRIPT der Name eines der Projekte f�r das jeweilige
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
	$id="SKRIPT";
} else {
	echo "<h1>Windows-Anleitung f�r das Skript: $id</h1>
	<p>(Zur <a href='./windows.php'>allgemeinen Windowsanleitung</a>)</p>";
}
	
echo "<h2>direkte SVN-Unterst�tzung im Explorer (geht nicht in der Uni)</h2>
<ol>
   <li>Den <a href='http://tortoisesvn.tigris.org/download.html'>SVN-Client</a>
   herunterladen</li>
   <li>Die heruntergeladene Datei ausf�hren</li>
   <li>In den Ordner \"Eigene Dateien\" gehen und dort die rechte Maustaste
   klicken. \"SVN Checkout\" w�hlen und folgende Angaben machen:<br>
   URL: <pre>svn+ssh://FRZ-Login@ppc214.mipool.uni-jena.de/home/stud/md01/joergs/.svnroot/$id</pre>
   FRZ-Login ist *dein* Benutzername im FRZ!";
   if ($id=="SKRIPT"){
   	echo "$id aus der obigen Liste ausw�hlen (und in der URL ersetzen),
   	z.B. hecker-parallel
   	Beispiel:
   	<pre>svn+ssh://peter3@ppc214.mipool.uni-jena.de/home/stud/md01/joergs/.svnroot/hecker-parallel</pre>";
   	}
   echo "</li>
   <li>skript.latex im Texnic-Center �ffnen</li>
   <li>LATEX->PDF einstellen und 3-mal (in Worten: drei mal) �bersetzen</li>
   <li>Ist alles gut gegangen -> weiter bei 9.</li>
   <li>Ist eine Fehlermeldung der Art
   <pre>! LaTeX Error: File `ntheorem.sty' not found.</pre>
   gekommen? Dann kopiere dir die Datei
   <a href='http://www.minet.uni-jena.de/~joergs/skripte/sty/ntheorem.sty'>
   http://www.minet.uni-jena.de/~joergs/skripte/sty/ntheorem.sty</a> in das
   Verzeichnis mit dem Skript. -> weiter bei 5.</li>
   <li>Sind viele Warnungen der Art<br>
   <pre>Package hyperref Warning: bookmark level for unknown satz defaults to 0.</pre>
   aufgetreten? Dann kopiere dir die Dateien aus
   <a href='http://www.minet.uni-jena.de/~joergs/skripte/sty/'>
   http://www.minet.uni-jena.de/~joergs/skripte/sty/</a> in das Verzeichnis
   mit dem Skript. -> weiter bei 5.</li>
   <li>fertig</li>
 </ol>


Du willst deine Kopie auf den neusten Stand brigen?
<ol><li>Gehe in das Verzeichnis, in dem dein Skript liegt.</li>
   <li>Rechte Maustaste klicken und \"SVN Update\" sagen.</li></ol>
   
Du hast �nderungen gemacht und willst diese ver�ffentlichen?
<ol><li>Sicherstellen, dass die Datei �bersetzt</li>
   <li>Im Explorer in das Verzeichnis mit dem Skript gehen. Rechte Maustaste
   und dann mit \"SVN Diff\" dir ansehen, was du ge�ndert hast und ob das
   so seien soll.</li>
   <li>Dann rechte Maustaste und SVN Commit sagen. Achte bitte darauf, dass
   du keine Dateien ver�ffentlichst, die von Latex generiert wurde. Sowas
   wie skript.toc, skript.thm oder skript.log, auch keine skript.pdf!</li>
   <li>Eine Beschreibung der �nderungen eingeben. Leere Beschreibungen werden
   abgelehnt, weil diese nicht zweckdienlich sind.
   <pre>Beispiel:
   * skript.latex
     + Paket graphicx und color hinzugef�gt, damit die Bilder funktionieren
   
     + alle \include durch \input ersetzt -- das ist, was man will.
   
     + Viele $$ hinzugef�gt
     
     + aus vielen log ein \log gemacht
     
     + viele \Work und \Time ersetzt
   
   * figures/parall_modell.fig
     + es fehlten die $$ um die P_n
   
   * figures/parall_modell.pdf, figures/parall_modell.pdf_t als
     \"Combined PDF/Latex\" aus XFig exportiert</pre></li></ol>

<h1>wenn der SVN-Client nicht geht (Windowspool)</h1>

<p>Ihr sollte auf alle F�lle eine Mail an frz@minet.uni-jena.de schicken mit
der Bitte den SVN-Client zu installiern oder dies wenigstens zu
erm�glichen.</p>

<ol><li>Putty von
<a href='http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html'>
http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html</a>
   herunterladen und installieren</li>
   <li>Putty starten und als Rechnername ppc214.mipool.uni-jena.de angeben.
   SSH ausw�hlen. Unter Connection->SSH den Punkt 2 bei bevorzugte
   SSH-Protokollversion w�hlen.</li>
   <li>�ffnen klicken und in dem neuen Fenster erst *deinen* Benutzernamen
   eingeben und dann das Unix-Passwort.</li>
   <li>Du siehst eine Kommandozeile.</li>
   <li>Gebe folgendes ein:
   <pre>svn checkout file:///home/stud/md01/joergs/.svnroot/$id</pre>";
   if ($id=="SKRIPT") {
   	echo "$id aus der obigen Liste ausw�hlen (und statt $id einsetzen),
   	z.B. hecker-parallel
   	Beispiel:
   	<pre>svn+ssh://peter3@ppc214.mipool.uni-jena.de/home/stud/md01/joergs/.svnroot/hecker-parallel</pre>";
   	}
   echo "</li>
   <li>Im Texnic-Center solltest du jetzt auf Laufwerk M: (das Laufwerk von
   paxp02f) ein Verzeichnis mit dem Namen des Skripts finden. Darin die
   Datei skript.latex �ffnen.</li>
   <li>LATEX->PDF einstellen und 3-mal (in Worten: drei mal) �bersetzen</li>
   <li>Ist alles gut gegangen -> weiter bei 11.</li>
   <li>Ist eine Fehlermeldung der Art<br>
   <pre>! LaTeX Error: File `ntheorem.sty' not found.</pre>
   gekommen? Dann kopiere dir die Datei
   http://www.minet.uni-jena.de/~joergs/skripte/sty/ntheorem.sty in das
   Verzeichnis mit dem Skript. -> weiter bei 7.</li>
   <li>Sind viele Warnungen der Art<br>
    <pre>Package hyperref Warning: bookmark level for unknown satz defaults to 0.</pre>
    aufgetreten? Dann kopiere dir die Dateien aus
    http://www.minet.uni-jena.de/~joergs/skripte/sty/ in das Verzeichnis
    mit dem Skript. -> weiter bei 7.</li>
   <li>Fertig</li></ol>

Du willst deine Kopie auf den neusten Stand brigen?
<ol><li>Putty starten und wie bei der Installation unter Punkt 2+3+4 verfahren.</li>
   <li>Den Befehl
   <pre>cd $id</pre>
   eingeben. $id ist der Verzeichnisname des Skripts.</li>
   <li>Dann den Befehl
   <pre>svn update eingeben</pre></li></ol>

Du hast �nderungen gemacht und willst diese ver�ffentlichen?
<ol><li>Sicherstellen, dass die Datei �bersetzt</li>
   <li>Erstelle mit Texnic-Center eine Datei changes (ohne Endung!), in der
   du die gemachten �nderungen dokumentierst.
   <pre>Beispiel:
   * skript.latex
     + Paket graphicx und color hinzugef�gt, damit die Bilder funktionieren
   
     + alle \include durch \input ersetzt -- das ist, was man will.
   
     + Viele $$ hinzugef�gt
     
     + aus vielen log ein \log gemacht
     
     + viele \Work und \Time ersetzt
   
   * figures/parall_modell.fig
     + es fehlten die $$ um die P_n
   
   * figures/parall_modell.pdf, figures/parall_modell.pdf_t als
     \"Combined PDF\/Latex\" aus XFig exportiert</pre></li>
   <li>Putty starten und wie bei der Installation unter Punkt 2+3+4 verfahren.</li>
   <li>Den Befehl
   <pre>cd $id</pre>
   eingeben. $id ist der Verzeichnisname des Skripts.</li>
   <li>Den Befehl
   <pre>svn diff | less</pre>
   eingeben und pr�fen, ob deine �nderungen so seien sollen. Mit den
   Cursortasten kannst du hoch- und runterscrollen und mit q wieder zur
   Kommandozeile.</li>
   <li>Mit dem Befehl
   <pre>svn commit -F changes</pre>
   die �nderungen �bertragen.</li></ol>
";
include('footer.php');
?>