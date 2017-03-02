// function myEach(arr, cb){
//   for (let i = 0; i < arr.length; i += 1){
//     cb(arr[i]);
//   }
// }

// // myEach([1,2,3], n => console.log(n + 1));

// Array.prototype.myMap = function (cb){
//    let newArr = [];
//    myEach(this, function(n) {
//      let a = cb(n)
//      newArr.push(a);
//    });
//    return newArr;
// }

// var arr = [1,2,3,4,5];

// let result = arr.myMap(n => n * n);

// console.log(result);


function once(callback){
  var called = 0;
  return function() {
    if (called === 0) {
      called++;
      return callback.apply(this, arguments);
    } else {
      console.log("Operation called already");
    }
  };
}

once(function(1,2){
  console.log('lol');
});
once(function(1,2){
  console.log('lol');
});
once(function(){
  console.log('lol');
});
