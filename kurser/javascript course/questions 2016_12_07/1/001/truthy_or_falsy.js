/*global window*/
/*jslint for:true*/


//1. Have a look at the document 09_Truthy_and_Falsy. Write a program
//similar to the one on page 6

var a;

if (a) {

    alert("Checking " + a + "\nIt is truthy!");

} else {
    alert("Checking " + a + "\n\n It is falsy!");
}

//var a; //checking undefined --> falsy
//var a = null; //checking null --> falsy
//var a = ""; //falsy
//var a = []; //truthy
//var a = 5 * "Monkey"; //checking NaN --> falsy
//var a = false; //checking false --> falsy
//var a = 0; //checking 0 --> falsy
//var a = a[2]; //error --> property 2 of undefined
//var a = {}; //checking object Object --> truthy