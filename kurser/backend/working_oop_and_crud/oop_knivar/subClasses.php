<?php

require_once ("knife.php");
require_once ("interface.php");
error_reporting(-1);

//skapa klass som implimentera interfacet
                                 /* interface */
class KitchenKnife extends Knife implements i_sharpenKnife{
    //use trait
    use tr_sharpenKnife;
    
    public $owner;
    
    public function __construct($owner, $length, $material) {
        $this->owner = $owner;
        parent::__construct($length, $material);
    }
}
                                 /* interface */
class CuttingKnife extends Knife implements i_sharpenKnife {
    /* trait */
    use tr_sharpenKnife;
    
    public $restaurantName;
    
    public function __construct($restaurantName, $length, $material) {
        
        $this->restaurantName = $restaurantName;
        // :: är när klasser kommunicerar med varandra
        parent::__construct($length, $material);  
} 
}