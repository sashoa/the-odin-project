//  Problem 1 -  Multiples of 3 and 5.
//  Find the sum of all the multiples of 3 or 5 below 1000.

function euler() {
    var number1 = 3,
        number2 = 5,
        sum = 0,
        i = 1;
    while (i < 1000) {
        if (i % 3 === 0 || i % 5 === 0) {
            sum += i;
        }
        i++;
    }
    return sum;
};

euler();