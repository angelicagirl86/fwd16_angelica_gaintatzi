/*global window*/
/*jslint for:true*/


//Intermediate 3 - Replace every third element

var myArray = [5,5,7,0,3,1,2,45,3,12];
var i;

console.log(myArray);

for(i = 2; i < 10; i = i + 3) {
    myArray[i] = 10;
}

console.log(myArray);
