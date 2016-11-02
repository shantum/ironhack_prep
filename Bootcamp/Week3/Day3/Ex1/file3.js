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

console.log(decode(words))
console.log(decode2(words))