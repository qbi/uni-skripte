<!-- $Id$ -->
<?php
include('header.php');

// echo "<b>id=-$id- body=-$body- knopf=$knopf $HTTP_REFERER</b><br>";
if ($id and $body and $knopf == Absenden)
{
    $id = trim($id);  // remove all newlines and something more that should
                      // not be there to prevent cross site scripting in mails
    mail("skripte@listserv.uni-jena.de", "Fehler im Skript $id [Webmail]",
         $body);

    echo "Die E-Mail wurde an die ".
      "<a href=\"http://http://lc03.rz.uni-jena.de/pipermail/skripte/\">".
      "Mailingliste</a> gesandt und sollte dort mit etwas Verz�gerung zu ".
      "lesen sein. Vielen Dank f�r die Unterst�tzung.";
}
else
  echo "Es gab Probleme beim Versand. Bitte wende Dich per E-Mail an die ".
      "Mailingliste.";

include('footer.php');
?>

