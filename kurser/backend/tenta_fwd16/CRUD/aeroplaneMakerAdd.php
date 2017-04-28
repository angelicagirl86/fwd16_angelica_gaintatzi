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
    //$planeMakerID = $_POST['planeMakerID'];
    $planeMakerName = $_POST['planeMakerName'];
    
        
    // checking empty fields
    if(empty($planeMakerName)) { 

        //link to the previous page
        //echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
        echo "<font color='red'>Plane Maker Name field is empty.</font><br/>";
    } else { 
        // if all the fields are filled (not empty) 
            
        //insert data to database        
        $sql = "INSERT INTO plane_maker(planeMakerID, planeMakerName) VALUES(:planeMakerID, :planeMakerName)";
        $query = $pdo->prepare($sql);
        
        $query->bindparam(':planeMakerID', $planeMakerID);
        $query->bindparam(':planeMakerName', $planeMakerName);
        $query->execute();
        
        
        //display success message
        echo "<font color='green'>Data added successfully.";
        echo "<br/><a href='aeroplaneMaker.php'>View Result</a>";
    }
}

/*
 * För att inte användaren ska behöva skriva siffror för en authorid, så vill vi
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
        <title>Add Aeroplane Maker</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <a href="aeroplane.php">Home</a> |
        <a href="aeroplaneMaker.php">Back</a>
    <br/><br/>

    <form action="aeroplaneMakerAdd.php" method="post" name="form1">
        <table width="25%" border="0">
            <tr>
                <!-- Här lägger vi till det nya låten -->
                <td>Aeroplane Maker Name</td>
                <td><input type="text" name="aeroplaneMakerName" /></td>
            </tr>
            
            <tr>
<td>


    

    
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