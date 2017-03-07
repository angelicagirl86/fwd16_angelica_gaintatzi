/*global window*/
/*jslint for:true*/


/*Exercise 5 - Write a program that has an object called cart. Write code that

allows the user to create names and values for the cart’s properties,

where the name is a product, and the value is the product’s price.

Make sure there is a way for the user to end input, so the program

can move onto the next stage. You can test if the program has

worked by doing console.log(cart);*/



var cart = {};
var product;
var price;
var total = 0;
var i;

while (true) {
    product = prompt("Enter your product");
    if (product === null) {
        break;
    }
    price = prompt("Enter the product's price");
    price = Number(price);
    if (price === null) {
        break;
    }
    cart[product] = price;
}
console.log(cart);

for (product in cart) {
    console.log("A(n) " + product + " costs " + cart[product] + " sek.");
    total = total + cart[product];
}
console.log("Your total is " + total + " sek.");