/*global window*/
/*jslint for:true*/


//Simple 5 - Times table


var m; //how many times?
var n; //number we are multiplying
var i;

m = prompt("Enter number of times: ");
m = Number(m); //convert to a number
n = prompt("Enter number to be multiplied: ");
n = Number(n); //convert to a number

for (i = 1; i < m + 1; i = i + 1) {
    console.log(i + " x " + n + " = " + i * n);
}