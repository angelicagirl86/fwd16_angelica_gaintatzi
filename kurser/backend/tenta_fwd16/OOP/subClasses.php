<?php

require_once ("aircraft.php");
require_once ("interface.php");
error_reporting(-1);

//skapa klass som implimentera interfacet
                                 /* interface */
class Interceptor extends Aircraft implements i_Texaco{
    //use trait
    use tr_Texaco;
    
    public $missiles;
    
    public function __construct($missiles, $aircraftDestignation, $speed, $range, $payload) {
        $this->missiles = $missiles;
        parent::__construct($aircraftDestignation, $speed, $range, $payload);
    }
}
                                 /* interface */
class Bomber extends Aircraft implements i_Texaco {
    /* trait */
    use tr_Texaco;
    
    public $bombs;
    
    public function __construct($bombs, $aircraftDestignation, $speed, $range, $payload) {
        
        $this->bombs = $bombs;
        // :: är när klasser kommunicerar med varandra
        parent::__construct($aircraftDestignation, $speed, $range, $payload);  
} 
}