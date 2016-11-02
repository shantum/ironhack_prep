var array = [2, -5, 10, 5, 4, -10, 0];

// the function should return every pair of positions where
// the addition of the numbers sum to zero

function decode(array){
    var result = [];
    for (var i=0; i < array.length; i++) {
        for (var j=0; j < array.length; j++) {
            if (array[i] + array[j] == 0) {
                result.push(i + ',' + j + ':' + array[i] + ',' + array[j])
            }
        }
    }
    return result;
}

console.log(decode(array))