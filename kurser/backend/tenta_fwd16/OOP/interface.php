<?php

//skapa trait som innehåller koden
trait tr_Texaco {
    public function refuelAircraft(){
        echo "Go Juice, thanks Texaco";
    }
}

//skapa interface (interface innehåller ingen kod)
interface i_Texaco {
    public function refuelAircraft();
}
