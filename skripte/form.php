<!-- $Id$ -->
<?php include('header.php'); ?>

<h1>Hinweise zur Form</h1>

<ul><li>Alle Dokumente sollten sich als PDF und PostScript mit
  <a href="http://www.pps.jussieu.fr/~beffara/soft/rubber/">rubber</a>
  �bersetzen lassen</li>

<li>Die Dokumente sind fast alle mit <tt>latin1</tt>-Codierung geschrieben. Dies
  sollte auch fortgef�hrt werden, wenn es nicht zu Problemen mit anderen
  Plattformen kommt, da man sonst Probleme im Umgang mit \verb bekommt und
  auch die Werkzeuge zur Bearbeitung keine Unterst�tzung daf�r bieten
  (angepasstes Suchen/Ersetzen,&nbsp;...)</li>

<li>Als Dokumentklasse hat sich <tt>scrreprt</tt> als g�nstig erwiesen, da das
  Skript schon die Ausma�e eines Buches annimmt, aber <tt>scrbook</tt> nicht die
  passende Klasse daf�r ist. Als Option sollte "twoside" gesetzt werden.</li>

<li>Als <tt>pagestyle</tt> finde ich "<tt>headings</tt>" gut, da im Seitenkopf das Kapitel
  und der Abschnitt stehen. <tt>\pagestyle{headings}</tt></li>

<li>Ob das Skript mit Absatzeinzug geschrieben wird oder nicht, sollte an
  der Menge des Textes festgemacht werden. LaTeX braucht eine gewisse
  Menge an Text pro Absatz um sinnvolle Formatierungen zu erreichen. Dies
  ist nicht m�glich, wenn jeder Absatz nur aus zwei S�tzen besteht. In
  dem Fall sollte der Absatzeinzug entfallen und daf�r ein Abstand
  zwischen den Abs�tzen gemacht werden. Dies wird mit der Klassenoption
  <tt>halfparskip*</tt> erreicht.

<li>F�r S�tze, Beispiele, Bemerkungen u.�. hat sich <tt>ntheorem</tt> als sehr
  brauchbar erwiesen.

  <a href='http://user.informatik.uni-goettingen.de/~may/Ntheorem/'>
  http://user.informatik.uni-goettingen.de/~may/Ntheorem/</a>

  Es ist auch m�glich, sich die Dateien unter
  http://www.minet.uni-jena.de/~joergs/skripte/sty/ in die Arbeitskopie
  des Skripts zu kopieren. Vorsicht: Diese nicht mit in das Repository
  aufnehmen!</li>

<li>F�r mathematische Belange hat sich <tt>amsmath</tt> als sehr gut erwiesen.</li>

<li>Als Algorithmenumgebung wird <tt>algorithm</tt> und <tt>algorithmic</tt> verwendet.
  Zu Finden sind diese beiden Pakete unter:

  <a href='http://www.ctan.org/tex-archive/macros/latex/contrib/algorithms/'>
  http://www.ctan.org/tex-archive/macros/latex/contrib/algorithms/</a></li>

<li>Bilder sollten mit <tt>xfig</tt> (mit -specialtext kann direkt LaTeX erzeugt
  werden), <tt>gnuplot</tt> oder <tt>tcm</tt> oder anderen vektororientierten Programmen
  erstellt werden. Ist dies nicht m�glich oder sinnvoll, dann sollte <tt>png</tt>
  oder <tt>jepg</tt> als Format gew�hlt werden. pdflatex kann keine ps- oder
  eps-Dateien einbinden!<br>

  Immer die Originaldateien der Programme mit ins Archiv legen!<br>

  ACHTUNG: Zur Erstellung von combined pdf/latex Bildern bitte auf die Version
  achten. Es hat sich ergeben, da� die pdf-Anteile der Bilder um 90� verdreht
  werden, wenn man mit xfig-Version < 3.2.5 arbeitet.</li>

<li>Jedes Dokument <b>muss</b> eine Erkl�rung �ber die Verwendbarkeit des
  Dokuments (Lizenz) und M�glichkeiten zur Kontaktaufnahme beinhalten. Als
  Vorlage daf�r kann das Vorwort aus dem
  <a href="vorlage/skript.latex">Beispielskript</a> verwendet werden.</li>

<li>Da regelm��g Ausgaben der Dokumente erstellt werden, sollte an einer
  Stelle im Dokument die Version des Dokuments (<tt>$LastChangedRevision$</tt>)
  und das Datum (<tt>$LastChangedDate$</tt>) der letzten �nderung verwerkt
  werden. Dies ist zum Beispiel im Vorwort des
  <a href="vorlage/skript.latex">Beispielskripts</a> umgesetzt. Daf�r hat sich
  das Paket <tt>svn</tt> als praktisch erwiesen. Zus�tzlich muss mit svn die
  Ersetzung der Schl�sselw�rter aktiviert werden:

  <pre>svn propset svn:keywords "LastChangedRevision LastChangedDate" skript.latex</pre></li>

<li>Es sollten nur die langen Formen der Keywords verwendet werden, da es
  unwahrscheinlicher ist, dass diese Zeichenketten in dem Dokument
  auftreten, als <tt>$Rev$</tt> oder <tt>$Date$</tt>.</li>

<li>Vorlagen f�r neue Skripte befinden sich im Verzeichnis
   <a href='./vorlage/'>vorlage</a></li>
</ul>

<?php include('footer.php'); ?>
