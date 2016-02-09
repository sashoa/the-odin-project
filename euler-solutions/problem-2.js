function euler() {
    var first = 1,
        second = 2,
        term = 0,
        sum = 0;
    while (term <= 4000000) {
        term = first + second;
        first = second;
        second = term;
        if (term % 2 === 0) sum += term;
    }
    return sum + 2; 
}

euler();

// //Solution 2

// function euler2() {
//     var seq = [],
//         sum = 0;
//     seq.push(1);
//     seq.push(2);
//     seq.push(3);
//     for (var i = 3; seq[seq.length - 1] <= 4000000; i++)
//         seq[i] = seq[i - 2] + seq[i - 1];

//     for (i = 0; i < seq.length; i++)
//         if (seq[i] % 2 === 0) sum += seq[i];
//     return sum;
// }

// euler2();
