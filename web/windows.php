<!-- $Id$ -->
<?php
include('header.php');

if (!$id) {
	$id="SKRIPT";
	echo "<h1>Allgemeine Windowsanleitung</h1>
	Im folgenden ist SKRIPT der Name eines der Projekte f�r das jeweilige
	Vorlesungsskript. Zur Zeit gibt es die folgenden:
	<ul>";
    	list_skripte("windows.php");
        echo "</ul>";
} else {
	echo "<h1>Windows-Anleitung f�r das Skript: $id</h1>
	<p>(Zur <a href='./windows.php'>allgemeinen Windowsanleitung</a>)</p>";
}
?>

<h2>direkte SVN-Unterst�tzung im Explorer (geht nicht in der Uni)</h2>
<ol>
   <li>Den <a href='http://tortoisesvn.net/download'>SVN-Client</a>
     herunterladen</li>
   <li>Die heruntergeladene Datei ausf�hren</li>
   <li>In den Ordner "Eigene Dateien" gehen und dort die rechte Maustaste
     klicken. "SVN Checkout" w�hlen und folgende Angaben machen:<br>
     URL: <pre>svn+ssh://FRZ-Login@ppc214.mipool.uni-jena.de/home/stud/md01/joergs/.svnroot/skripte/<?php echo $id; ?></pre>
     FRZ-Login ist <b>dein</b> Benutzername im FRZ!
<?php
   if ($id=="SKRIPT"){
   	echo "$id aus der obigen Liste ausw�hlen (und in der URL ersetzen),
   	z.&nbsp;B. f�r <tt>hecker-parallel</tt>
   	<pre>svn+ssh://peter3@ppc214.mipool.uni-jena.de/home/stud/md01/joergs/.svnroot/skripte/hecker-parallel</pre>";
   }
?>
     Achtung: Du musst Dein Passwort <b>dreimal</b> eingeben. Eine
     wiederholte Abfrage bedeutet also nicht, dass das Passwort falsch war.
   </li>
   <li><tt>skript.latex</tt> im Texnic-Center �ffnen</li>
   <li>LATEX->PDF einstellen und dreimal �bersetzen</li>
   <li>Ist alles gut gegangen -> weiter bei 8.</li>
   <li>Wenn es eine Fehlermeldung wegen fehlender Dateien gab und Du nicht
     wei�t, wie diese erzeugen sollst, dann hole Dir die Datei
<?php echo "<a href=\"$id-mit-grafiken.tgz\">$id-mit-grafiken.tgz</a>"; ?>
     und entnehme dieser die fehlenden Dateien. -> weiter bei 5.
   </li>
   <li>fertig</li>
</ol>


Du willst deine Kopie auf den neusten Stand brigen?
<ol><li>Gehe in das Verzeichnis, in dem dein Skript liegt.</li>
   <li>Rechte Maustaste klicken und "SVN Update" sagen.</li></ol>

Du hast �nderungen gemacht und willst diese ver�ffentlichen?
<ol><li>Sicherstellen, dass die Datei �bersetzt</li>
   <li>Im Explorer in das Verzeichnis mit dem Skript gehen. Rechte Maustaste
   und dann mit "SVN Diff" dir ansehen, was du ge�ndert hast und ob das
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
     + es fehlten die $$ um die P_n</pre></li></ol>

<h1>wenn der SVN-Client nicht geht (Windowspool)</h1>

<p>Ihr sollte auf alle F�lle eine E-Mail an frz@minet.uni-jena.de schicken mit
der Bitte den SVN-Client zu installieren oder dies wenigstens zu
erm�glichen.</p>

<ol><li>Putty von
<a href='http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html'>
http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html</a>
   herunterladen und installieren</li>
   <li>Putty starten und als Rechnername ppc214.mipool.uni-jena.de angeben.
   SSH ausw�hlen. Unter Connection->SSH den Punkt&nbsp;2 bei bevorzugte
   SSH-Protokollversion w�hlen.</li>
   <li>�ffnen klicken und in dem neuen Fenster erst <b>deinen</b> Benutzernamen
   eingeben und dann das Unix-Passwort.</li>
   <li>Du siehst eine Kommandozeile.</li>
   <li>Gebe folgendes ein:
   <pre>svn checkout file:///home/stud/md01/joergs/.svnroot/skripte/<?php echo $id; ?></pre>
<?php
   if ($id=="SKRIPT") {
   	echo "$id aus der obigen Liste ausw�hlen (und statt $id einsetzen),
   	z.&nbsp;B. f�r <tt>hecker-parallel</tt>
   	<pre>file:///home/stud/md01/joergs/.svnroot/skripte/hecker-parallel</pre>";
   	}
?>
   </li>
   <li>Im Texnic-Center solltest du jetzt auf Laufwerk M: (das Laufwerk von
   paxp02f) ein Verzeichnis mit dem Namen des Skripts finden. Darin die
   Datei skript.latex �ffnen.</li>
   <li>LATEX->PDF einstellen und dreimal �bersetzen</li>
   <li>Ist alles gut gegangen -> weiter bei 10.</li>
   <li>Wenn es eine Fehlermeldung wegen fehlender Dateien gab und Du nicht
     wei�t, wie diese erzeugen sollst, dann hole Dir die Datei
<?php echo "<a href=\"$id-mit-grafiken.tgz\">$id-mit-grafiken.tgz</a>"; ?>
     und entnehme dieser die fehlenden Dateien. -> weiter bei 7.
   </li>
   <li>fertig</li>
</ol>

Du willst deine Kopie auf den neusten Stand brigen?
<ol><li>Putty starten und wie bei der Installation unter Punkt 2+3+4 verfahren.</li>
   <li>Den Befehl
   <pre>cd <?php echo $id; ?></pre>
   eingeben. <?php echo $id; ?> ist der Verzeichnisname des Skripts.</li>
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
     + es fehlten die $$ um die P_n</pre></li>
   <li>Putty starten und wie bei der Installation unter Punkt 2+3+4 verfahren.</li>
   <li>Den Befehl
   <pre>cd <?php echo $id; ?></pre>
   eingeben. <?php echo $id; ?> ist der Verzeichnisname des Skripts.</li>
   <li>Den Befehl
   <pre>svn diff | less</pre>
   eingeben und pr�fen, ob deine �nderungen so seien sollen. Mit den
   Cursortasten kannst du hoch- und runterscrollen und mit q wieder zur
   Kommandozeile.</li>
   <li>Mit dem Befehl
   <pre>svn commit -F changes</pre>
   die �nderungen �bertragen.</li>
</ol>

<?php
include('footer.php');
?>
