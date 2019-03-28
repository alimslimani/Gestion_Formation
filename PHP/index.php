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
        $sql = $cnx->prepare("select idFormation,nomFormation,lieuFormation,prixFormation,dureeFOrmation 
                              from formation");
        // execure query
        $sql->execute();       
        echo "<input type='button' value='Inscription' style='margin-left:5%;width: 400px; height: 50px' onclick='showPresence(this.id)'>";
        echo "<input type='button' class='ok' value='Presence' style='margin-left:60%;width: 400px; height: 50px' onClick='inscrireAgent(this.id)' >";       
        echo "<div class='container'>";
        echo "<div id='td' class='item'>";
        echo "<table id='table'>";
        echo "<br>"; 
        echo "<tr>";
        echo "<th>ID</th>";
        echo "<th>Nom de la formation</th>";
        echo "<th>Lieu</th>";
        echo "<th>Prix</th>";
        echo "<th>Durée</th>";
        echo "</tr>";   
        foreach($sql-> fetchAll(PDO::FETCH_NUM) as $line){   
            echo "<tr onClick='ligneTableau($(this));'>";  
                echo "<td>" .$line[0]."</td>";
                echo "<td>" .$line[1]."</td>";
                echo "<td>" .$line[2]."</td>";
                echo "<td>" .$line[3]."</td>";  
                echo "<td>" .$line[4]."</td>";                             
            echo "</tr>";
        }    
        echo "</table>";  
        echo "</div>";
        echo "<div id='divPresence' class='item'></div>";
        echo "</div>";
        echo "<input type='button' class='ok' value='Save' style='margin-left:center;width: 400px; height: 50px' onclick=''>";  
    ?>
</body>
</html>