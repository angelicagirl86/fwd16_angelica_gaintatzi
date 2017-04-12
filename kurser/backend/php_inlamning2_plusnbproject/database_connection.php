<?php

try {
    /*Skapa skälva kopplingen*/
    $conn = new PDO('mysql:host=83.168.227.23; dbname=db1164707_AngelG', 'u1164707_AngelG', 'j3.nM a6o}');
    /*Sätt error hanterigen*/
    $conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    
} catch (PDOException $e) {
    echo $e->getMessage();
    die();
}