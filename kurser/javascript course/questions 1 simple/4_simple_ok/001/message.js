/*global window*/
/*jslint for:true*/


//Simple 4 - How far can i see?



var d; //distance I can see
var r = 6371; //radius of earth km
var h; //your height

h = prompt("Your height in meters: ");
h = Number(h); //convert to number data type
h = h / 1000; //convert metres to kilimetres
console.log(h);
console.log(r);

d = Math.sqrt((r + h) * (r + h) - r * r); //the formula
d = d.toFixed(1); //works but it returns a string, not a number
//d = Math.round(d); //will round the kilometres (stroggulopoihsh)
//d = Math.round(d * 10)/10; //the multiplication will give us 47 (if height 1.8) and the division 4.8
//d = Math.floor(d); //stroggulopoihsh pros ta katw
//d = Math.ceil(d); //stroggulopoihsh pros ta panw

alert("You can see " + d + " km");