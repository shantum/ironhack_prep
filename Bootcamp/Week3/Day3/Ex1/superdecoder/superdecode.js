var decode = require('../decoder/decode.js')

var sentence = 'fill the proper thank for the cow'

function superDecode(sentence, type, order) {
    var array = sentence.split(' ');

    array = array.filter(function(word, index) {
        return (type == 'even'? index % 2 ==0: index % 2 !=0);
    })
    array = (order == 'backwards'? array.reverse() : array)
    return decode(array)
}

console.log(superDecode(sentence, 'even', 'backwards'))