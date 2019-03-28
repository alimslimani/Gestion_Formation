
<?php
    include 'cnx.php';
    // write query 
    $sql = $cnx->prepare("update inscription set presence = 1 where numAgent ='".$_GET['codeAg']."'");
    // execure query
    $sql->execute();

?>