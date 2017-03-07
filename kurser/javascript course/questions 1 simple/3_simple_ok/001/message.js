/*global window*/
/*jslint for:true*/


//Simple 2 - Calculate VAT


//declare function
//function calcVat() {
//"use strict";
var x;
var y;
var z;
x = prompt("Enter first: ");
y = prompt("Enter second: ");
z = prompt("Enter third: ");


if (x >= y && x >= z) {
    console.log(x);
    if (y > z) {
        console.log(y);
        console.log(z);
    } else {
        console.log(z);
        console.log(y);
    }
} else if (y >= x && y >= z) {
    console.log(y);
    if (x > z) {
        console.log(x);
        console.log(z);
    } else {
        console.log(z);
        console.log(x);
    }
} else {
    console.log(z);
    if (y > z) {
        console.log(y);
        console.log(z);
    } else {
        console.log(x);
        console.log(y);
    }
}

