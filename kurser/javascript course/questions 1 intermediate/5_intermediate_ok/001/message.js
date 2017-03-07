/*global window*/
/*jslint for:true*/


//Intermediate 5 - A/C

var heaterOnOff = "off";
var heaterOnOff = "on";

//var currentStatusheater;

var temperature;
var thermosstatValue = 20;

function checkStatus(status, action) {
    "use strict";
    if (action !== status) {
        return action; 
    } else {
        return status;
    }
}

while (true) {
    if (temperature === null) {
        break;
    }
    temperature = prompt("Enter temperature: ");

    if 
}