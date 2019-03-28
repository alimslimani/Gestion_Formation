<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>M1INFO_DEV_TP3_AJAX</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../CSS/style.css" />
    <script src="../JQUERY/jquery-3.1.1.js"></script>
    <script src="../JS/functions.js"></script>
</head>
<body>
<?php
    include 'cnx.php';
    // write query 
    $sql = $cnx->prepare("  SELECT a.idAgent,a.nomAgent,a.prenomAgent,a.villeAgent
                            FROM agent a,formation f, inscription i
                            WHERE f.idFormation = i.numFormation
                            AND i.numAgent = a.idAgent
                            AND i.presence = 0
                            AND f.idFormation ='".$_GET['idForm']."'");
    // execure query
    $sql->execute();
    echo "<br>"; 
    echo "<table id='table'>"; 
    echo "<tr>";
    echo "<th>ID</th>";
    echo "<th>Nom</th>";
    echo "<th>Prenom</th>";
    echo "<th>Vile</th>";
    echo "</tr>";   
    foreach($sql-> fetchAll(PDO::FETCH_NUM) as $line){   
        echo "<tr onClick='ligneTableau($(this));'>";  
            echo "<td>" .$line[0]."</td>";
            echo "<td>" .$line[1]."</td>";
            echo "<td>" .$line[2]."</td>";
            echo "<td>" .$line[3]."</td>";                         
        echo "</tr>";
    }    
    echo "</table>";    
?>
</body>
</html>