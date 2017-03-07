/*global window*/
/*jslint for:true*/


/*Exercise 2 - Look at your answer to Question 4 from Questions 2016-12-05. Re-
write the code using:

a) the maker pattern with a loop, for n number of contacts.

b) the constructor pattern, with a loop, for n number of contacts.

c) Add two new methods, using the prototype feature, which enable

you to change or update the email or phone number property.

The prompt should be changed to say:

“Enter record number to view, or c to change existing record”

You will need to add some new code to handle what happens

when the user enters “c”.*/



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
