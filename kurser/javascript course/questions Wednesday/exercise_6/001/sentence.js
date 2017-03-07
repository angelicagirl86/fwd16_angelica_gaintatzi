/*global window*/
/*jslint for:true*/


//Exercise 6 - Most frequent character in sentence

/*var sentence;
var i;
var key;
var biggest;
var number;

sentence = prompt("Enter a sentence: ");
    counter = {};

for (i = 0; i < sentence.length; i = i + 1) {
    counter[sentence[i]] = (counter[sentence[i]] || 0) + 1;
}

biggest = 0, number;
for (key in counter) {
    if (counter[key] > biggest) {
        biggest = counter[key];
        number = key;
    }
}
console.log(number);*/

var sentence;
var i;
var array = [];
var temp;
var count = 1;
var largest = 0;
var letter = "";

sentence = "Espresson House";
sentence = sentence.toLowerCase();

for (i = 0; i < sentence.length; i = i + 1) {
    temp = sentence.charAt(i);
    if (temp !== " " && temp !== "," && temp !== ".") {
        array.push(temp);
    }
}

array.sort();

for (i = 0; i < array.length; i = i + 1) {
    if (array[i] === array[i + 1]) {
        count = count + 1;
    } else {
        count = 1;
    }
    if (count > largest) {
        largest = count;
        letter = array[i];
    }
}

console.log(letter + " occurs " + largest + " times.");
