var message = 'hello'
var specialChars = '!@#$%^&*()_+{}[] ?/>.<,:;"'

function isItSpecial (char) {
    result = false
    if (specialChars.indexOf(char) >= 0) {
        result = true
    }
    return result;
}

function encode(message, shift) {
    message = message.split('');
    shift = shift % 26;
    shift = (shift == 0? 1 : shift);
    var encyrptedString = '';

    message.forEach(function (char) {
        if (isItSpecial(char)) {
            new_code = char.charCodeAt(0);
        } else {
            original_code = char.charCodeAt(0);
            new_code = original_code + shift;
                if (char == char.toUpperCase() && new_code > 90 && new_code < 97) {
                    var unshift = new_code - 90;
                    new_code = 65 + unshift;
                } else if (char == char.toLowerCase() && new_code > 122) {
                    var unshift = new_code - 122;
                    new_code = 97 + unshift;
                }
            }
            new_char = String.fromCharCode(new_code);
            encyrptedString += new_char;
        }
    )
    return encyrptedString;
}

function decode(message, shift) {
    message = message.split('');
    shift = shift % 26
    shift = (shift == 0? 1 : shift);
    var decryptedString = '';

    message.forEach(function (char) {
        if (isItSpecial(char)) {
            decrypted_code = char.charCodeAt(0);
        } else {
            encrypted_code = char.charCodeAt(0);
            decrypted_code = encrypted_code - shift;
                if (char == char.toUpperCase() && decrypted_code < 65) {
                    var unshift = 65 - decrypted_code;
                    decrypted_code = 90 - unshift;
                } else if (char == char.toLowerCase() && decrypted_code < 97) {
                    unshift = 97 - decrypted_code;
                    decrypted_code = 122 - unshift;
                }
            }
            new_char = String.fromCharCode(decrypted_code);
            decryptedString += new_char;
    })
    return decryptedString;
}


encryptedMessage = encode('hello/world!', 35000);
decryptedMessage = decode(encryptedMessage, 35000);

console.log(decryptedMessage);
console.log(encryptedMessage);