<!-- $Id$ -->
<?php
include('header.php');
	
echo "<h1>Hinweise zur Form</h1>

<ul><li>Alle Dokumente sollten PDFs werden, da sich in PDFs suchen und Text
  herauskopieren l�sst. Im Verbund mit hyperref lassen sich auch ein
  Lesezeichenmen� aufbauen und im Dokument verweise untereinander
  erstellen.</li>

<li>Die Dokumente sind fast alle mit latin1-Codierung geschrieben. Dies
  sollte auch fortgef�hrt werden, wenn es nicht zu Problemen mit anderen
  Platformen kommt, da man sonst Probleme im Umgang mit \verb bekommt und
  auch die Werkzeuge zur Bearbeitung keine Unterst�tzung daf�r bieten
  (angepasstes Suchen/Ersetzen,...)</li>

<li>Als Dokumentklasse hat sich scrreprt als g�nstig erwiesen, da das
  Skript schon die Ausma�e eines Buches annimmt, aber book nicht die
  passende Klasse daf�r ist. Als Option sollte \"twoside\" gesetzt werden.</li>

<li>Als pagestyle finde ich \"headings\" gut, da im Seitenkopf das Kapitel
  und der Abschnitt stehen. \\pagestyle{headings}</li>

<li>Ob das Skript mit Absatzeinzug geschrieben wird oder nicht, sollte an
  der Menge des Textes festgemacht werden. Latex braucht eine gewisse
  Menge an Text pro Absatz um sinnvolle Formatierungen zu erreichen. Dies
  ist nicht m�glich, wenn jeder Absatz nur aus zwei S�tzen besteht. In
  dem Fall sollte der Absatzeinzug gelassen werden und daf�r ein Abstand
  zwischen den Abs�tzen gemacht werden.
  
<pre>\setlength{\parindent}{0ex}
\addtolength{\parskip}{2ex}</pre></li>

<li>F�r S�tze, Beispiele, Bemerkungen u.�. hat sich ntheorem als sehr
  brauchbar erwiesen. Leider gibt es einige Probleme in Verbindung mit
  hyperref. Daher sollten die aktuellen Versionen der beiden Pakete von
  deren Websiten verwendet werden. Denoch gibt es Probleme mit den beiden
  Paketen. Viele davon konnte ich in dem Skript 'schmei�er-funk-ana'
  beheben. [Anm.: wer gut Tex kann, kann mal nach einer L�sung f�r die
  fehlende Theorem-Bezeichnung in \\thref suchen. Danke!]
  
  <a href='http://user.informatik.uni-goettingen.de/~may/Ntheorem/'>
  http://user.informatik.uni-goettingen.de/~may/Ntheorem/</a>

  Es ist auch m�glich, sich die Dateien unter
  http://www.minet.uni-jena.de/~joergs/skripte/sty/ in die Arbeitskopie
  des Skripts zu kopieren. Vorsicht: Diese nicht mit in das Repository
  aufnehmen!</li>

<li>F�r mathematische Belange hat sich \"amsmath\" als sehr gut erwiesen.</li>

<li>Als Algorithmenumgebung wird \"algorithm\" bzw. \"algorithmic\" verwendet.
  Zu Finden sind diese beiden Pakete unter:
  
  <a href='http://www.ctan.org/tex-archive/macros/latex/contrib/algorithms/'>
  http://www.ctan.org/tex-archive/macros/latex/contrib/algorithms/</a></li>

<li>Bilder sollten mit xfig (mit -specialtext kann direkt Latex erzeugt
  werden), gnuplot oder tcm oder anderen vektororientierten Programmen
  erstellt werden. Ist dies nicht m�glich oder sinnvoll, dann sollte png
  oder jpg als Format gew�hlt werden. pdflatex kann keine ps- oder
  eps-Dateien einbinden!<br>
  
  Immer die Originaldateien der Programme mit ins Archiv legen!<br>

  ACHTUNG: Zur Erstellung von combined pdf/latex Bildern bitte auf die Version
  achten. Es hat sich ergeben, da� die pdf-Anteile der Bilder um 90� verdreht
  werden, wenn man mit xfig-Version < 3.2.5 arbeitet.</li>

<li>Da regelm��g PDFs erstellt werden, sollte auf der
  Titelseite ein \\thanks{\$LastChangedRevision\$ vom \$LastChangedDate\$} in
  \\title{} stehen. (\\title{bla\\thanks{\$...\$}}) Daf�r muss mit svn die
  Ersetzung f�r diese \"Keywords\" gesetzt werden:
  
  <pre>svn propset svn:keywords \"LastChangedRevision LastChangedDate\" skript.latex</pre></li>

<li>Es sollten nur die langen Formen der Keywords verwendet werden, da es
  unwahrscheinlicher ist, dass diese Zeichenketten in dem Dokument
  auftreten, als \$Rev\$ oder \$Date\$.</li>
  
<li>Vorlagen f�r neue Skripte befinden sich im Verzeichnis
   <a href='./vorlage/'>vorlage</a></li></ul>
";
include('footer.php');
?>