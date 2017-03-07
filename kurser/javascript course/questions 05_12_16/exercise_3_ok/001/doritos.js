/*global window*/
/*jslint for:true*/


/*Exercise 3 - Write a program that creates an object called person. Give the object

the properties of name and weight, with appropriate values. Give it

also a method called eatDoritos, which when called, increases the

weight property by 0.5kg. Use this.*/



var person;

person = {
    name: "John",
    weight: 100,
    eatDoritos: function () {
        return this.weight + 0.5;
    }
};

console.log(person.eatDoritos());