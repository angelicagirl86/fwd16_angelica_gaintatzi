/*global window*/
/*jslint for:true*/


//Exercise 2 - mouse

var myArray;
var i;

myArray = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];

for (i = 1; i < myArray.length; i = i + 2) {
    myArray[i] = "Mouse";
}
console.log(myArray);