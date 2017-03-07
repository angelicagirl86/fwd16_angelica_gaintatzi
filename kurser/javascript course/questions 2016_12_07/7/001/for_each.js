/*global window*/
/*jslint for:true*/


/*7. Closure - Write a function that returns another function.
The first function, when called, will allow you to supply it with a
number d, and return a new function that can then be used to set
numbers to d decimal places.
Have a read at the section on Higher Order Functions in Eloquent
JavaScript, for help.*/


function test(a) {
    a = a * 10;
    return function () {
        return a;
    };
}

//x is now a function
var x = test(10);
var b = x();



/*
function add10 (a) {
    a = a + 10;
}
add10(5);
console.log(a);  -----> this won't work because a is outside it's scope
*/


//Instead
/*
var a = 0;  //a is outside the function
function add () {
    a = a + 10;
}
add();
console.log(a);
*/





//Scope exercises
/*
var b = 0;
function add10(a) {
    a = b + 10;
    return a;
}
add10(5);
console.log(a);
*/


/*
var a = 10;
function test() {
    var a = 10;
    console.log(a);
}
test();
console.log(a);
*/


/*
var b = 5;
function test() {
    var a = 10;
    console.log("I can see " + b); //this message will print I can see 5
}

console.log("I can see " + a); //a is inside the function so we can't see it'
*/

