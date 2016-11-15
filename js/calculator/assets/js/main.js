/*function my_max(arr) {
  var max = arr[0]
  for (var i = 1; i < arr.length; i++){
    if (arr[i] > max) max = arr[i];
  }
  return max;
}


function vowelCount(str){
  var numOfVowels = 0;
  var vowels = ["a","e","i","o","u"];
  for (var i = 0; i < str.length; i++){
    for (var j = 0; j < vowels.length; j++){
      if (str[i] === vowels[j].toLowerCase()) numOfVowels++;
    }
  }
  return numOfVowels;
}

function reverse(str){
  var reversedString = "";
  for (i = str.length - 1; i >= 0; i--){
    reversedString += str[i];
  }
  return reversedString;
}
*/

function add(num1, num2){
  return num1 + num2;
}

function multiply(num1, num2){
  return num1 * num2;
}

function subtract(num1, num2){
  return num1 - num2;
}

function devide(num1, num2){
  return num1 / num2;
}

var store = [];
var result
var screenElement = document.getElementById("screen")
var currentNum = ""

function press(char){
  if (!isNaN(char)){
    currentNum += char
    screen(char);
  }
  else if (char === "c"){
    store = [];
    currentNum = "";
    screenElement.innerHTML = "";
  }
  else if (char === "="){
    store.push(currentNum);
    currentNum = "";
    screenElement.innerHTML = "";
    action();
  }
  else {
    screen(char)
    store.push(currentNum);
    store.push(char);
    currentNum = ""
  }
}

function action(){
  var first = parseInt(store[0]);
  var second = parseInt(store[2]);
  switch (store[1]) {
    case "+":
      i += 2;
      result = add(first, second)
      store = [];
      break;
  
    case "-":
      result = subtract(first, second)
      store = [];
      break;

    case "*":
      result = multiply(first, second)
      store = [];
      break;

    case "/":
      result = devide(first, second)
      store = [];
      break;

    default:
     console.log(store);
     result = "error";
      break;
  }
  screen(result);
}

function screen(str){
  screenElement.innerHTML += str;
}