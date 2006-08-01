<!-- $Id$ -->
<?php
include('header.php');
	
echo "<p>Das Projekt
\"Vorlesungsskripte der Fakult�t f�r Mathematik und Informatik\" ist eine Plattform 
von Studierenden f�r Studierende, um Skripte zu sammeln, zu erstellen, zu 
bearbeiten und nat�rlich zu verwenden.</p>

<p>Mittlerweile sind schon ein paar Skripte vorhanden. 
Einige sind nur zu Teilen, andere sind vollst�ndig aber
daf�r sind noch Probleme beim �bersetzen. Aber das alles soll auch nur
ein Anfang sein. Wir hoffen, dass sich weitere Studenten finden, die
Skripte verbessern, sei es in Bezug auf den Inhalt, Vollst�ndigkeit oder
den Latex-Satz. Leider sind vereinzelt auch noch Fehler versteckt, sowohl
inhaltliche als auch orthographische.<p>

<p>Zum Schreiben der Skripte verwenden wir 
<a href='http://www.latex-project.org/'>LaTeX</a>. Hinweise zur Form und
eine Vorlage zum Schreiben neuer Skripte findet man unter
<a href='form.php'>Dokumentation</a>.</p>

<p>Es gestaltet sich schwierig, 
&Auml;nderungen von verschiedenen Benutzern von Hand einzupflegen. F�r diese
Aufgabe hat man sogenannte 
<a href='http://de.wikipedia.org/wiki/Versionsverwaltung'>Versions-Managment-Programme</a>
entwickelt, die sich
darum k�mmern, dass �nderungen zweier Benutzer nicht im Konflikt
zueinander stehen oder dass alle Benutzer auch die �nderungen der anderen
Benutzer erhalten. Wir verwenden 
<a href='http://subversion.tigris.org/'>Subversion</a>.</p>

<p>Diese Programme sch�tzen nat�rlich nicht vor Sabotage oder davor neue
Fehler in die Dokumente einzupflegen (es w�re zu sch�n, wenn ein Programm
erkennen kann, ob ein Text inhaltlich korrekt ist :). Daher appellieren wir
an die soziale Kompetenz der Leute! Die Skripte sind alle kostenlos
und ohne Verpflichtungen verf�gbar. Es sollte also keiner einen Grund
haben, die Skripte absichtlich zu sch�digen. Aber denoch eine kleine
Drohung: Es kann jeder jederzeit nachvollziehen, wer welche �nderungen
gemacht hat (svn diff oder svn log).</p>

<p>Wie man Subversion verwendet, wird in der 
<a href='svn.php'>Dokumentation</a> erl�utert. Dort gibt es auch
eine Erkl�rung f�r
<a href='windows.php'>Windows</a>.</p>

<p>F�r alle diejenigen, die nicht aktiv an den Skripten mitarbeiten
m�chten, gibt es unter
<a href='pdf.php'>Download</a> t�glich aktuelle PDF-Versionen.</p>




";
include('footer.php');
?>
