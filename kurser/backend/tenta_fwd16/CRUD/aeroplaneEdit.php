
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
$aeroplaneID = $_GET['aeroplaneID'];

/*
 * vi använder värdet på id från föregående sida som vi fick från get och 
 * skriver en sql fråga där vi anvnder :id för vara basis för en where fråga.
 * Vi vill alltså bara presentera ett enskild skämt baserat på den id vi
 * sprarade från raden från förra sidan.
 */
$sql = "SELECT * FROM aeroplane WHERE aeroplaneID=:aeroplaneID"; 
$query = $pdo->prepare($sql); 
$query->execute(array(':aeroplaneID' => $aeroplaneID)); 
/*
 * Resultatet av nedanstående kod kommer vi fylla ut i en html forumlär längre
 * ner på sidan. 
*/
while($row = $query->fetch()) 
{ 
$aeroplaneName = $row['aeroplaneName']; 
$aeroplaneTopSpeed = $row['aeroplaneTopSpeed'];
$aeroplaneRange = $row['aeroplaneRange'];
$planeMakerID = $row['planeMakerID'];
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
$aeroplaneID = $_POST['aeroplaneID']; 

$aeroplaneName=$_POST['aeroplaneName']; 
$aeroplaneTopSpeed=$_POST['aeroplaneTopSpeed'];
$aeroplaneRange=$_POST['aeroplaneRange'];
$planeMakerID=$_POST['planeMakerID']; 


// checking empty fields

if(empty($aeroplaneName) || empty($aeroplaneTopSpeed) || empty($aeroplaneRange) || empty($planeMakerID)) { 

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
echo "<font color='red'>Plane Maker ID is empty.</font><br/>"; 
}

} else { 
/*
 * vi använder sql syntaxen för uppdateringar och skickar med id för raden.
 * OBS att man i PDO använder platshållare (joketext=:joketext) där :joketext är
 * namnet på platshållaren för att para ihop det som finns i  formuläret till
 *  databasen. Detta läggs till i variablen $sql
*/

$sql = "UPDATE aeroplane SET aeroplaneName=:aeroplaneName, aeroplaneTopSpeed=:aeroplaneTopSpeed, aeroplaneRange=:aeroplaneRange, planeMakerID=:planeMakerID WHERE aeroplaneID=:aeroplaneID";

/*
 * vi använder pdo objektets prepare metod som tar $sql som argument och sparar
 * resultaet i variabeln $query
*/
$query = $pdo->prepare($sql); 
/*Sedan binder vi det som finns i platshållaren till variabeln*/
$query->bindparam(':aeroplaneID', $aeroplaneID);
$query->bindparam(':aeroplaneName', $aeroplaneName); 
$query->bindparam(':aeroplaneTopSpeed', $aeroplaneTopSpeed);
$query->bindparam(':aeroplaneRange', $aeroplaneRange);
$query->bindparam(':planeMakerID', $planeMakerID);
//vi använder det som nu finns i $query för att köra sql frågan 
$query->execute(); 

// Alternative to above bindparam and execute 
// $query->execute(array(':id' => $id, ':joketext' => $joketext)); 

//header används för att skicka tillbaka efter proccesn är klart till en sida
header("Location: aeroplane.php"); 
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
<title>Edit Aeroplane</title>
</head> 
<body> 
<a href="aeroplane.php">Home</a> 
<br/><br/>

<form name="form1" method="post" action="aeroplaneEdit.php"> 
<table border="0"> 
<tr> 
<td>Aeroplane</td> 
<!-- Resultatet av vår sql fråga från rad34 lägger vi en input, man kan alltid
blanda html och php som ni ser, genom att flika in php taggar som start och slut-->
<td><input type="text" name="aeroplaneName" value="<?php echo $aeroplaneName;?>" ></td>
<td><input type="number" name="aeroplaneTopSpeed" value="<?php echo $aeroplaneTopSpeed;?>" ></td>
<td><input type="number" name="aeroplaneRange" value="<?php echo $aeroplaneRange;?>" ></td>
</tr> 
<tr> 
<td>Maker</td> 
<td>
<!-- För att användare ine ska behöva stoppa in siffror för en cdID så skapar
vi en dropdown, där resultatet av sql frågan från rad 47 $cdQuery stoppar in
i $cd-->    
<select name="planeMakerID"> 
<?php 
while($planeMaker = $planeMakerSqlQuery->fetch()) { 
if ($planeMaker['planeMakerID'] == $planeMakerID) { 
/*
 * Vi använder id som vi har för att, som defualt visa den författaren som var
 * kopplat till ett viss skämt vald från föregående sida.
*/ 
echo "<option value=\"{$planeMaker['planeMakerID']}\" selected>{$planeMaker['planeMakerName']}</option>"; 
} else { 
/*
 * Skulle vi däremot vilj ändra författaren till nåt annat det som vi fick från
 * förra sidan, så väljer vi det nu och också fångar upp id:et för den
 * författaren
*/ 
echo "<option value=\"{$planeMaker['planeMakerID']}\">{$planeMaker['planeMakerName']}</option>"; 
} 
} 
?> 
</select> 
</td> 
</tr> 

<tr>
<!-- Vi visar inte id för den flygplanen vi vill redigera -->    
<td><input type="hidden" name="aeroplaneID" value=<?php echo $_GET['aeroplaneID'];?></td> 
<td><input type="submit" name="update" value="Update"></td> 
</tr> 
</table> 
</form>
<!--För att logga ut skickar vi användaren till en sida där sessionen avslutas
med session_destroy--> 
<a href="logout.php">Logout</a>
    </body>
</html>
