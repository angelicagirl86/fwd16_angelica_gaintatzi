<!DOCTYPE html>


<html>
    <head>
        <meta charset="UTF-8">
        <title>Refuelling Charter for Aircraft</title>
    </head>
    <body>
        <?php 
        
            require_once ("subClasses.php");
            
            //anropa statiska metoden som är i abstrakta klassen (innan vi använder konstruktorn)
            /*För att komma åt konstanter, statiska egenskaper och metoder i en instans
             * så använder man sig av instansnamnet:: efter följd av konstanten eller den statiska egenskapen eller metoden
            */
            Aircraft::stat();
            
            
            //skapa objekt av klassen Interceptor
            //Det är viktigt att paratmetrarna i instansen skrivs i exakt samma ordningsföljd som konstrutorn i klassen.
            //$missiles, $$aircraftDestignation, $speed, $range, $payload
            $avroCanada = new Interceptor(6, "Viggen", 2000, 3500, 6000);
           
            print_r($avroCanada->refuelAircraft()."<br>");
           
            //skapa objekt av klassen Bomber
            //$bombs, $$aircraftDestignation, $speed, $range, $payload
            $boeingB52 = new Bomber(40, "B52", 900, 15000, 20000);
            
            
            
            //Visa våra objekt
            // TRUE som argument här formaterar vår print output
            echo "<pre>".print_r($avroCanada, TRUE)."</pre>";
            
            print_r($boeingB52->refuelAircraft()."<br>");
            echo "<pre>".print_r($boeingB52, TRUE)."</pre>";
            
         ?>
    </body>
</html>
 