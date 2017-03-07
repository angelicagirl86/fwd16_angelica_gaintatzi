/*global window*/
/*jslint for:true*/


/*Exercise 4 - Write a program to input three contacts into an array. Each array

element should hold an object with name, address and telephone

properties. (The array variable name should be contact.

Add a method to your code that will output all details of all contact

records. Don’t just output the object to the console. Extract the

important information from the object and present it properly.*/


//create object
var i;
var contact = []; //array
contact[0] = { //array that contains an object
    name: "Name 1",
    address: "Address 1",
    telephone: 123,
    allDetails: function () {
        console.log(contact[0].name + ", " + contact[0].address + ", " + contact[0].telephone + ".");
    }
};

contact[1] = {
    name: "Name 2",
    address: "Address 2",
    telephone: 456,
    allDetails: function () {
        console.log(contact[1].name + ", " + contact[1].address + ", " + contact[1].telephone + ".");
    }
};

contact[2] = {
    name: "Name 3",
    address: "Address 3",
    telephone: 789,
    allDetails: function () {
        console.log(contact[2].name + ", " + contact[2].address + ", " + contact[2].telephone + ".");
    }
};
for (i = 0; i < 3; i = i + 1) {
    contact[i].allDetails();
}
