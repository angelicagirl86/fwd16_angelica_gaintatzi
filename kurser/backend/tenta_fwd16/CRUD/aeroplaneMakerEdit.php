<?php 
// including the database connection file 
include_once("config.php");
//include_once("config_local.php");

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

/*
 * Vi vill ta emot resultatet från föregående sida och med $_GET ta emot id för
 * den raden vi ska redigera
*/
$planeMakerID = $_GET['planeMakerID'];

/*
 * vi använder värdet på id från föregående sida som vi fick från get och 
 * skriver en sql fråga där vi anvnder :id för vara basis för en where fråga.
 * Vi vill alltså bara presentera ett enskild skämt baserat på den id vi
 * sprarade från raden från förra sidan.
 */
$sql = "SELECT * FROM plane_maker WHERE planeMakerID=:planeMakerID"; 
$query = $pdo->prepare($sql); 
$query->execute(array(':planeMakerID' => $planeMakerID)); 
/*
 * Resultatet av nedanstående kod kommer vi fylla ut i en html forumlär längre
 * ner på sidan. 
*/
while($row = $query->fetch()) 
{ 
$planeMakerID = $row['planeMakerID'];
$planeMakerName = $row['planeMakerName'];
}

/*
 * På redigerings sidan så kommer vi en textruta för att en enskild skämt.
 * Vi vill däremot inte att användaren ska behöva skriva en authorid för
 * skämtet. Förutom att möjligheten till misstförstånd blir större att hålla 
 * koll pa en siffra så försämrar det avsevärt användarupplevelsen.
 * Vi skapar en seperat fråga som kommer vara basis för en dropdown senare i 
 * html formuläret
*/
//prepare för dropdown
$planeMakerSql = "SELECT * FROM plane_maker"; 
$planeMakerSqlQuery = $pdo->prepare($planeMakerSql); 
$planeMakerSqlQuery->execute();


?> 
<?php 

/*
 * vi kontrollerar om vi har tryckt på uppdatera knappen som har namnet update
 * i formuläret, i så fall så lagrar vi id och fälten joketext och authorid i 
 * respektive variabel, som ska finnas i vår db tabell.
*/
if(isset($_POST['update'])) 
{ 
$planeMakerID = $_POST['planeMakerID']; 

$planeMakerName=$_POST['planeMakerName'];

// checking empty fields
if(empty($planeMakerName)) {
    echo "<font color='red'>Plane Maker Name field is empty.</font><br/>"; 
} else { 
/*
 * vi använder sql syntaxen för uppdateringar och skickar med id för raden.
 * OBS att man i PDO använder platshållare (joketext=:joketext) där :joketext är
 * namnet på platshållaren för att para ihop det som finns i  formuläret till
 *  databasen. Detta läggs till i variablen $sql
*/

$sql = "UPDATE plane_maker SET planeMakerName=:planeMakerName WHERE planeMakerID=:planeMakerID";

/*
 * vi använder pdo objektets prepare metod som tar $sql som argument och sparar
 * resultaet i variabeln $query
*/
$query = $pdo->prepare($sql); 
/*Sedan binder vi det som finns i platshållaren till variabeln*/
$query->bindparam(':planeMakerID', $planeMakerID); 
$query->bindparam(':planeMakerName', $planeMakerName);
//$query->bindparam(':songLyricsby', $songLyricsby);
//vi använder det som nu finns i $query för att köra sql frågan 
$query->execute(); 

// Alternative to above bindparam and execute 
// $query->execute(array(':id' => $id, ':joketext' => $joketext)); 

//header används för att skicka tillbaka efter proccesn är klart till en sida
header("Location: aeroplaneMaker.php"); 
}
}

?> 
<!DOCTYPE html> 
<!-- 
To change this license header, choose License Headers in Project Properties. 
To change this template file, choose Tools | Templates 
and open the template in the editor. 
--> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Edit Aeroplane Maker</title> 
</head> 
<body> 
<a href="aeroplane.php">Home</a> |
<a href="aeroplaneMaker.php">Back</a>

<form name="form1" method="post" action="planeMakerEdit.php"> 
<table border="0"> 
<tr> 
<td>Category</td> 
<!-- Resultatet av vår sql fråga från rad34 lägger vi en input, man kan alltid
blanda html och php som ni ser, genom att flika in php taggar som start och slut-->
<td><input type="text" name="planeMakerName" value="<?php echo $planeMakerName;?>" ></td>
</tr> 
<tr>
<td>

<!-- Vi visar inte id för den låten vi vill redigera -->    
<td><input type="hidden" name="planeMakerID" value=<?php echo $_GET['planeMakerID'];?></td> 
<td><input type="submit" name="update" value="Update"></td> 
</tr> 
</table> 
</form>
<!--För att logga ut skickar vi användaren till en sida där sessionen avslutas
med session_destroy--> 
<a href="logout.php">Logout</a>
    </body>
</html>
