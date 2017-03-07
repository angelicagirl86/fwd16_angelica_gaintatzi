/*global window*/
/*jslint for:true*/


function Dog(breed, name, colour) {
    "use strict";
    this.breed = breed;
    this.dogName = name;
    this.colour = colour;

    this.bark = function () {
        alert(this.dogName + " says WOOOOOOOF!");
    };
}

var dog1 = new Dog("Bulldog", "Bruce", "white");
console.log(dog1.dogName);
console.log(dog1.colour);
dog1.bark();