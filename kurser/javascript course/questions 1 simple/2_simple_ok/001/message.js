/*global window*/
/*jslint for:true*/


//Simple 2 - Calculate VAT


//declare function
function calcVat() {
    "use strict";
    var total = 0;
    var productPrice;

    while (true) {
        productPrice = prompt("Enter the price of the product: ");
        if (productPrice === null) { //instead of null we could have an empty string "". 
            break; //null to break if user presses cancel. "" if the user presses enter
        }
        productPrice = Number(productPrice);
        total = total + productPrice;
    }
    total = total + (total * 0.25);
    alert("Result: " + total);
}

//call function
calcVat();