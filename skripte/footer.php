<!-- $Id$ -->
<?php
	echo"
</td>

	</tr>

	<tr>

	  <td class='navbar' colspan='2' valign='bottom' width='100%'>
	    <address>
    		
  
	      <!--<a href='http://'> 
		<img src='http://logo.png'
		     width='88'
		     height='31'
		     border='0'
		     align='right'
		     alt='Logo'/>
	      </a>-->
	      
	      <a href='http://validator.w3.org/check?uri=referer'><img
        	src='./images/valid-html401.png'
        	alt='Valid HTML 4.01 Transitional' height='31' width='88' align='right' border='0'>
              </a>
              <a href='http://jigsaw.w3.org/css-validator/'>
  		<img style='border:0;width:88px;height:31px'
       		src='./images/vcss' 
       		alt='Valid CSS!' border='0' align='right'>
 	      </a>
 	      <small>
               Letzte Aktualisierung dieser Seite: ";
if ( $file=fopen("skripte.Date", "r") )
{
    echo trim(fgets($file));
    fclose($file);
}
echo " [";
if ( $file=fopen("skripte.Author", "r") )
{
    echo trim(fgets($file));
    fclose($file);
}
echo "]
	      </small>
	    </address>
	  </td>

	</tr>

    </table>

  </body>

</html>
";
?>
