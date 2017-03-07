/*global window*/
/*jslint for:true*/


/*Exercise 1 - Write a program where you enter a number n, and the function
outputs n even numbers. For example, if you enter 5, the output
would be:
0 2 4 6 8*/


//function isEven() {
    //"use strict";


    var n;
    var i;

    n = prompt("Enter a number: ");


    for (i = 0; i < n; i = i + 1) {
        console.log(i * 2);
    }
