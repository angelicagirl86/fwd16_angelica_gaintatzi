/*global window*/
/*jslint for:true*/


//Advanced Question 1

for (i =1; i < 101; i = i +1) {
    bigArray.push(i); 
}

index = Math.round(Math.random() * 99); //use a random generator to select a number from this array. The generator creates a random index number


while (smallArray.length < 10) {
    index = math.round(Math.random() * 99);
    if (bigArray[index] !== -1) {
        smallArray.push(bigArray[index]);
        bigArray[index] = -1;
    }
}
