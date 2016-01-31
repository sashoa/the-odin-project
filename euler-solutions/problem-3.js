function euler() {
    var num = 976,
        factor = [],
        seq = [],
        isprime = false;
    for (var i = 1; i <= num ; i++)
        if (num % i === 0)
            factor.push(i);
    if (num % 2 === 0) seq.push(2);
    for (var i = 0; i < factor.length -1 ; i++) {
    	for (var j = 2; j < factor[i]; j++) {
    		if (factor[i] !== 1 && factor[i] !== j){
    			if (factor[i] % j === 0) isprime = false; 
    			else isprime = true;
    		}
    		if (isprime === false) break;
    		else continue;
    	};
    	if (isprime === true) seq.push(factor[i]);
    };
    console.log(seq);
}
euler();