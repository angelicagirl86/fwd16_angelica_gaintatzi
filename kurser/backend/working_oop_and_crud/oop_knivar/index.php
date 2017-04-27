<!DOCTYPE html>


<html>
    <head>
        <meta charset="UTF-8">
        <title>Knifes</title>
    </head>
    <body>
        <?php 
        
            require_once ("subClasses.php");
            
            //anropa statiska metoden som är i abstrakta klassen (innan vi använder konstruktorn)
            /*För att komma åt konstanter, statiska egenskaper och metoder i en instans
             * så använder man sig av instansnamnet:: efter följd av konstanten eller den statiska egenskapen eller metoden
            */
            Knife::stat();
            
            
            //skapa objekt av klassen KitchenKnife
            //Det är viktigt att paratmetrarna i instansen skrivs i exakt samma ordningsföljd som konstrutorn i klassen.
            //$owner, $length, $material
            $bestKitchenknife = new KitchenKnife("Angelica", 20, "Metal");
           
            print_r($bestKitchenknife->sharpenKnife()."<br>");
           
            //skapa objekt av klassen CuttingKnife
            //$restaurantName, $length, $material
            $bestCuttingknife = new CuttingKnife("Sohails Grill House", 17, "Steel");
            
            //Visa våra objekt
            // TRUE som argument här formaterar vår print output
            echo "<pre>".print_r($bestKitchenknife, TRUE)."</pre>";
            echo "<pre>".print_r($bestCuttingknife, TRUE)."</pre>";
            
         ?>
    </body>
</html>
 