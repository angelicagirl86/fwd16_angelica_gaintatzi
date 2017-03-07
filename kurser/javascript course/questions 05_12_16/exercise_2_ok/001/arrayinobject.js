/*global window*/
/*jslint for:true*/


/*Exercise 1 - Using literal object notation, write a simple program that creates an

object of something meaningful that has properties. It could be a car,

a dog or anything that has obvious properties.*/



var arr = ["matches", "knife", "accelerant", "cedar wood", "stick", "tinder plug"];
var obj = {};
var i = 0;
for (i = 0; i < arr.length; i = i + 1) {
obj[arr[i]] = 0;
}
console.log(obj);