<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        include 'database_connection.php';
        echo "<h2>PHP Inlämning 2</h2>";
        
        //call store procedure account with parameter 'Sohail'
        $sql = "CALL account('Sohail')";
        $result = $conn->query($sql);
        
        
     //create class Bank
        class Bank {
            public $firstname;
            public $lastname;
            public $accountname;
            public $balance;
            
            public function __construct($firstname,$lastname,$accountname,$balance) {
                $this->firstname = $firstname;
                $this->lastname = $lastname;
                $this->accountname = $accountname;
                $this->balance = $balance;
            }
        }
        
        $row = $result->fetch(PDO::FETCH_OBJ);
        $sohail = new Bank ($row->accountFname, $row->accountLname, $row->accountName ,$row->accountBalance);
        echo $sohail->firstname . ". " . $sohail->lastname . " has: " . $sohail->accountname . " account with " . $sohail->balance . " balance"; 
  
     ?>
    </body>
</html>
