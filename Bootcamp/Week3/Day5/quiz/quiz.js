var read = require('read');
var i = 0;

var Question = function(question, answer) {
  this.question = question;
  this.answer = answer;
  this.id = i++
}

q1 = new Question('what is my name?', 'macbook')
q2 = new Question('what is your name?', 'shantum')

options = {
  prompt: q1.question
}
 read(options, displayQuestion)

function displayQuestion(err, answer) {
  if (answer == q1.answer) {
    console.log('success')
  }
}



console.log(q1.id)
console.log(q2.id)
