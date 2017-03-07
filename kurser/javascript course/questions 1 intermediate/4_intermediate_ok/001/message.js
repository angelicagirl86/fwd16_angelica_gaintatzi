/*global window*/
/*jslint for:true*/


//Intermediate 4 - Sorting algorithm

var myArray = [];
var myArrayNum = [];
var i;
var j;
var myString;
var temp;

myString = prompt("Enter ten numbers separeted by commas");
myArray = myString.split(",");

for (i = 0; i < 10; i = i + 1) {
    myArrayNum[i] = Number(myArray[i]);
}

for (i = 0; i < 9; i = i + 1) {
    for (j = 0; j < 10; j = j + 1) {
        if (myArrayNum[j] > myArrayNum[j + 1]) {
            temp = myArrayNum[j];
            myArrayNum[j] = myArrayNum[j + 1];
            myArrayNum[j + 1] = temp;
        }
    }
}

for (i = 0; i < 10; i = i + 1) {
    console.log(myArrayNum[i]);
}
window.prompt();