//calculate factorial of number using recursion

function factorial(x) {
    if (x === 1) { //
        return 1;
    }
    return x * factorial(x - 1)
}

console.log(factorial(5))

//calculate GCD of two numbers

function gcd(a, b) {
    if (!b) {
        return a;
    }
    return gcd(b, a % b)
}

console.log(gcd(21345, 653))

//print integers in range

var range = function(start_num, end_num)
{
  if (end_num - start_num === 2)
  {
    return [start_num + 1];
  }
  else
  {
    var list = range(start_num, end_num - 1);
    list.push(end_num - 1);
    return list;
  }
};

console.log(range(2,9));

//sum of an array
function sum(array) {

}

//exponent
function exponent(num, power) {
   if (power === 1) {
     return num
   }
   return num * exponent(num, power - 1)
 }

console.log(exponent(8, 2))

//fibonacci
function fibonacci(length)