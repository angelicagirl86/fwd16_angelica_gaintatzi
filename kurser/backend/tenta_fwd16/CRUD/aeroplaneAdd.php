<?php
//include_once("config_local.php");
include_once("config.php");

/*
 * Vi organiserar sidan på sån sätt att vi har all processkod här i toppen av
 * sidan. All information som vi behöver processa hämtas från den nedre delen
 * av sidan där html formuläret finns.
 * Där finns namnen på formulärfälten som vi använder i php koden här upp för 
 * att processas.
*/

/*
 * Session start koden lägger vi till på samtliga sidor som ska vara skyddade
*/
session_start();
if(empty($_SESSION['email']))
{
 header("location:index.php");
}

echo "Welcome ".$_SESSION['name']."<br>";

if(isset($_POST['Submit'])) {    
    $aeroplaneName = $_POST['aeroplaneName'];
    $aeroplaneTopSpeed = $_POST['aeroplaneTopSpeed'];
    $aeroplaneRange = $_POST['aeroplaneRange'];
    $planeMakerID = $_POST['planeMakerID'];
    
        
    // checking empty fields
    if(empty($aeroplaneName) || empty($aeroplaneTopSpeed) || empty($aeroplaneRange)  || empty($planeMakerID)) { 

                
        if(empty($aeroplaneName)) {
            echo "<font color='red'>Aeroplane Name field is empty.</font><br/>";
        }
        
        if(empty($aeroplaneTopSpeed)) {
            echo "<font color='red'>Aeroplane Top Speed field is empty.</font><br/>";
        }
        
        if(empty($aeroplaneRange)) {
            echo "<font color='red'>Aeroplane Range field is empty.</font><br/>"; 
        }
        
        if(empty($planeMakerID)) { 
            echo "<font color='red'>Plane Maker field is empty.</font><br/>";    
        }
        
        //link to the previous page
        echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
    } else { 
        // if all the fields are filled (not empty) 
            
        //insert data to database        
        $sql = "INSERT INTO aeroplane(aeroplaneName, aeroplaneTopSpeed, aeroplaneRange, planeMakerID) VALUES(:aeroplaneName, :aeroplaneTopSpeed, :aeroplaneRange, :planeMakerID)";
        $query = $pdo->prepare($sql);
       
        $query->bindparam(':aeroplaneName', $aeroplaneName);
        $query->bindparam(':aeroplaneTopSpeed', $aeroplaneTopSpeed);
        $query->bindparam(':aeroplaneRange', $aeroplaneRange);
        $query->bindparam(':planeMakerID', $planeMakerID);
        $query->execute();
        
        
        //display success message
        echo "<font color='green'>Data added successfully.";
        echo "<br/><a href='aeroplane.php'>View Result</a>";
    }
}

/*
 * För att inte användaren ska behöva skriva siffror för en categoryId, så vill vi
 * skapa en dropdown så att användare kan välja från namnlista från databasen
 * som ladda i en dropdown.
 * Nedanståend sql fråga är basen för den dropdown
*/
$planeMakerSql = "SELECT * FROM plane_maker"; 
$planeMakerSqlQuery = $pdo->prepare($planeMakerSql);
$planeMakerSqlQuery->execute();
        
?>

<!DOCTYPE html>

<html>
    <head>
        <title>Add Aeroplane</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <a href="aeroplane.php">Home</a>
    <br/><br/>

    <form action="aeroplaneAdd.php" method="post" name="form1">
        <table width="25%" border="0">
            <tr>
                <!-- Här lägger vi till det nya låten -->
                <td>Aeroplane Name</td>
                <td><input type="text" name="aeroplaneName" /></td>
                <td>Aeroplane Top Speed</td>
                <td><input type="number" name="aeroplaneTopSpeed" /></td>
                <td>Aeroplane Range</td>
                <td><input type="number" name="aeroplaneRange" /></td>
            </tr>
            
            <tr>
<td>Maker</td> 
<td>

<!-- Vi skapar en dropdown som laddas med makers från databasen, så att inte
användare inte lägger till maker som inte existerar-->    
<select name="planeMakerID"> 
    
<?php

$planeMakerID="";
while($planeMaker = $planeMakerSqlQuery->fetch()) { 
if ($planeMaker['planeMakerID'] == $planeMakerID) { 
//The author is currently associated to the joke, select it by default 
    //den raden kanske inte behövs
echo "<option value=\"{$planeMaker['planeMakerID']}\" selected>{$planeMaker['planeMakerName']}</option>"; 
} else { 
//The author is not currently associated to the joke 
echo "<option value=\"{$planeMaker['planeMakerID']}\">{$planeMaker['planeMakerName']}</option>"; 
} 
} 
?> 
    
</select> 
</td> 
</tr> 
    <tr> 
        <td></td>
            <td><input type="submit" name="Submit" value="Add"></td>
            </tr>
        </table>
    </form>
<!--För att logga ut skickar vi användaren till en sida där sessionen avslutas
med session_destroy-->    
    <a href="logout.php">Logout</a>
    </body>
</html>