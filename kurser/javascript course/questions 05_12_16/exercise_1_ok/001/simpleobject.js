/*global window*/
/*jslint for:true*/


/*Exercise 1 - Using literal object notation, write a simple program that creates an

object of something meaningful that has properties. It could be a car,

a dog or anything that has obvious properties.*/


//create object

var cat;
cat = {
    name: "Fiona",
    color: "black",
    eyeColor: "blue",
    age: 7,
    fur: "long"
};

cat.breed = "persian";

//access object
console.log(cat.name + " is a " + cat.breed + " cat.");