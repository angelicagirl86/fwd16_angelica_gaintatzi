/*global window*/
/*jslint for:true*/


//Intermediate 2 - Implication

var a;
var b;
var i;

a = false;
b = false;
console.log("a = " + a + " b = " + b + " a => b = " + (!a || b));

a = false;
b = true;
console.log("a = " + a + " b = " + b + " a => b = " + (!a || b));

a = true;
b = false;
console.log("a = " + a + " b = " + b + " a => b = " + (!a || b));

a = true;
b = true;
console.log("a = " + a + " b = " + b + " a => b = " + (!a || b));