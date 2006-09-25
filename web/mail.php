<!-- $Id$ -->
<?php
include('header.php');

echo "id=-$id- body=-$body-";
if ($id and $body)
{
    $id = trim($id);  // remove all newlines and something more that should
                      // not be there
    mail("skripte@listserv.uni-jena.de", "Fehler im Skript $id [Webmail]",
         $body);
}
else echo "nicht versandt."
?>

Die E-Mail wurde an die <a href="http://www.listsrv.uni-jena.de/">Mailingliste</a>
gesandt. Vielen Dank für die Unterstützung.

<?php
include('footer.php');
?>

