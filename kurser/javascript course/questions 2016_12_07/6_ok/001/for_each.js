/*global window*/
/*jslint for:true*/


//6 - Look at the following code. Can you re-write it using the forEach method?
/*
var i;
var colours = ["red", "cyan", "magenta", "yellow", "green", "blue"];

for (i = 0; i < array.length; i = i + 1) {
    console.log(colours[i]);
}*/

//-----------------------------------------------


/*
var myArray = ["London", "Bristol", "Birmingham", "Sheffield", "Manchester", "Liverpool"];
var longest = 0;
var town;

function doStuff(array, action) {
    var i;
    for (i = 0; i < array.length; i = i + 1) {
        action(array[i]);
    }
}

doStuff(myArray, function (string) {
    if (string.length > longest) {
        longest = string.length;
        town = string;
    }
});

console.log(town + " " + longest);*/




/*
var myArray = ["London", "Bristol", "Birmingham", "Sheffield", "Manchester", "Liverpool"];
var longest = 0;
var town;

myArray.forEach(function (string) {
    if (string.length > longest) {
        longest = string.length;
        town = string;
    }
});

console.log(town + " " + longest);
*/



var colours = ["red", "cyan", "magenta", "yellow", "green", "blue"];
var longest = 0;
var letters;

colours.forEach(function (string) {
    if (string.length > longest) {
        longest = string.length;
        letters = string;
    }
});

console.log(letters + " " + longest);