<!-- $Id$ -->
<?php
include('header.php');
	
echo "<h1>Hinweise zur Form</h1>

<ul><li>Alle Dokumente sollten PDFs werden, da sich in PDFs suchen und Text
  herauskopieren lässt. Im Verbund mit hyperref lassen sich auch ein
  Lesezeichenmenü aufbauen und im Dokument verweise untereinander
  erstellen.</li>

<li>Die Dokumente sind fast alle mit latin1-Codierung geschrieben. Dies
  sollte auch fortgeführt werden, wenn es nicht zu Problemen mit anderen
  Platformen kommt, da man sonst Probleme im Umgang mit \verb bekommt und
  auch die Werkzeuge zur Bearbeitung keine Unterstützung dafür bieten
  (angepasstes Suchen/Ersetzen,...)</li>

<li>Als Dokumentklasse hat sich scrreprt als günstig erwiesen, da das
  Skript schon die Ausmaße eines Buches annimmt, aber book nicht die
  passende Klasse dafür ist. Als Option sollte \"twoside\" gesetzt werden.</li>

<li>Als pagestyle finde ich \"headings\" gut, da im Seitenkopf das Kapitel
  und der Abschnitt stehen. \\pagestyle{headings}</li>

<li>Ob das Skript mit Absatzeinzug geschrieben wird oder nicht, sollte an
  der Menge des Textes festgemacht werden. Latex braucht eine gewisse
  Menge an Text pro Absatz um sinnvolle Formatierungen zu erreichen. Dies
  ist nicht möglich, wenn jeder Absatz nur aus zwei Sätzen besteht. In
  dem Fall sollte der Absatzeinzug gelassen werden und dafür ein Abstand
  zwischen den Absätzen gemacht werden.
  
<pre>\setlength{\parindent}{0ex}
\addtolength{\parskip}{2ex}</pre></li>

<li>Für Sätze, Beispiele, Bemerkungen u.ä. hat sich ntheorem als sehr
  brauchbar erwiesen. Leider gibt es einige Probleme in Verbindung mit
  hyperref. Daher sollten die aktuellen Versionen der beiden Pakete von
  deren Websiten verwendet werden. Denoch gibt es Probleme mit den beiden
  Paketen. Viele davon konnte ich in dem Skript 'schmeißer-funk-ana'
  beheben. [Anm.: wer gut Tex kann, kann mal nach einer Lösung für die
  fehlende Theorem-Bezeichnung in \\thref suchen. Danke!]
  
  <a href='http://user.informatik.uni-goettingen.de/~may/Ntheorem/'>
  http://user.informatik.uni-goettingen.de/~may/Ntheorem/</a>

  Es ist auch möglich, sich die Dateien unter
  http://www.minet.uni-jena.de/~joergs/skripte/sty/ in die Arbeitskopie
  des Skripts zu kopieren. Vorsicht: Diese nicht mit in das Repository
  aufnehmen!</li>

<li>Für mathematische Belange hat sich \"amsmath\" als sehr gut erwiesen.</li>

<li>Als Algorithmenumgebung wird \"algorithm\" bzw. \"algorithmic\" verwendet.
  Zu Finden sind diese beiden Pakete unter:
  
  <a href='http://www.ctan.org/tex-archive/macros/latex/contrib/algorithms/'>
  http://www.ctan.org/tex-archive/macros/latex/contrib/algorithms/</a></li>

<li>Bilder sollten mit xfig (mit -specialtext kann direkt Latex erzeugt
  werden), gnuplot oder tcm oder anderen vektororientierten Programmen
  erstellt werden. Ist dies nicht möglich oder sinnvoll, dann sollte png
  oder jpg als Format gewählt werden. pdflatex kann keine ps- oder
  eps-Dateien einbinden!<br>
  
  Immer die Originaldateien der Programme mit ins Archiv legen!<br>

  ACHTUNG: Zur Erstellung von combined pdf/latex Bildern bitte auf die Version
  achten. Es hat sich ergeben, daß die pdf-Anteile der Bilder um 90° verdreht
  werden, wenn man mit xfig-Version < 3.2.5 arbeitet.</li>

<li>Da regelmäßg PDFs erstellt werden, sollte auf der
  Titelseite ein \\thanks{\$LastChangedRevision\$ vom \$LastChangedDate\$} in
  \\title{} stehen. (\\title{bla\\thanks{\$...\$}}) Dafür muss mit svn die
  Ersetzung für diese \"Keywords\" gesetzt werden:
  
  <pre>svn propset svn:keywords \"LastChangedRevision LastChangedDate\" skript.latex</pre></li>

<li>Es sollten nur die langen Formen der Keywords verwendet werden, da es
  unwahrscheinlicher ist, dass diese Zeichenketten in dem Dokument
  auftreten, als \$Rev\$ oder \$Date\$.</li>
  
<li>Vorlagen für neue Skripte befinden sich im Verzeichnis
   <a href='./vorlage/'>vorlage</a></li></ul>
";
include('footer.php');
?>