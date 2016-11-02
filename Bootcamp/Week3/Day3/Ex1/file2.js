var numbers = '800:70:190:1200'

function averageFromString(string) {
    var array = string.split(':');
    var average;
    var sumOfArray = array.reduce((sum, number) => sum + parseInt(number), 0)
    var arraySize = array.length
    average = sumOfArray / arraySize;
    return average;
}

console.log(averageFromString(numbers));