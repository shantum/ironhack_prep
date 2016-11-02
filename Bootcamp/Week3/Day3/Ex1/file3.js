var words = ['dead', 'bygone', 'landing', 'cheaply',
            'assumed', 'incorrectly', 'attention',
            'agent'];

// function decoder(word_array) {
//     var index = 0;
//     var secretMessage = '';

//     function letterPicker(word, i) {
//         return word.charAt(i);
//     }

//     for (var i=0; i < word_array.length; i++) {
//        secretMessage += letterPicker(word_array[this, index]);
//     }

//     if (index == 5) {
//         index = 0;
//     }
//     return secretMessage;
// }

// Matias method simple
function decode(array) {
    var secretMessage = '';
    var counter = 0;
    for (var i=0; i< array.length; i++) {
        secretMessage += array[i][counter]
        counter = counter == 4? 0 : counter + 1;
    }
    return secretMessage;
}

// matias more advanced but better method
function decode2(array) {
    var secretMessage = '';
    array.forEach(function(word, index) {
        secretMessage += word[index % 5];
    })
    return secretMessage;
}

var sentence = 'fill the proper thank for the cow'

function superDecode(sentence, conditions) {
    // define all the neccesary variables
    var options = conditions.split('-')
    var option1;
    var option2;
    var index = 0;
    var array = sentence.split(' ')

    // parse the given conditions; set option1
    if (options[0] == 'even') {
        option1 = 2;
    } else if (options[0] == 'odd') {
        option1 = 1;
    } else if (option[0] == 'all') {
        option1 = 0;
    }

    //parse conditions and set option2
    if (options[1] == 'backwards') {
        array = array.reverse();
    }


    // use option1 to select only the required number elements from array
    function evenSelector(array) {
        var selectedArray = [];
            for (var i=0; i < array.length; i++) {
            if (i % option1 === 0) {
                selectedArray.push(array[i]);
                }
            }
        return selectedArray;
    }

    // select incremental terms from selected array
    function decoder(array) {
        var secretMessage = '';
        evenSelector(array).forEach(function(word, index) {
            secretMessage += word[index % 5]
        })
        return secretMessage;
    }

    return decoder(array);
}


// matias more advanced using ternary operators
function superDecode2(sentece, type, order) {
    var array = sentence.split(' ');
    array = array.filter(function(word, index) {
        return (type == 'even'? index % 2 ==0: index % 2 !=0);
    })
    array = (order == 'backwards'? array.reverse() : array)
    return decode2(array)
}

console.log(superDecode(sentence, 'even-backwards'))
console.log(superDecode2(sentence, 'even', 'backwards'))