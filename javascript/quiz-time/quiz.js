
var user = {}
var responses = []

function question1() {
  var name = prompt('What is your name?')
  user.name = name
}

question1(); // don’t forget to call the function!

function question2() {

  var firstQuestion = prompt('Does null === 0 ? (Yes or No)')

// why do you need to convert the answer to lowercase?
  if (firstQuestion.toLowerCase() === 'yes') {
    firstQuestion = true
  } else if (firstQuestion.toLowerCase() === 'no') {
    firstQuestion = false
  } else {
// what if the user writes something other than yes or no? 
// they will have to answer the question again
    alert("Please answer either Yes or No");
    return question2();
  }
  responses.push(firstQuestion); // add the true or false value to the responses array
}

question2();

function question3() {
  var js = prompt('What was the original name for JavaScript: Java, LiveScript, JavaLive, or ScriptyScript?');
  js = js.toLowerCase();
  switch (js) {
    case 'livescript':
    	responses.push(true);
    	console.log('right answer');
    	break;
    case 'java':
        responses.push(false);
    	console.log('wrong answer');
    	break;
    case 'javalive':
        responses.push(false);
    	console.log('wrong answer');
    	break;
    case 'scriptyscript':
        responses.push(false);
    	console.log('wrong answer');
    	break;
    default:
    	question3();	
  }
}

question3();


function question4() {
  var js = prompt('What year is it: 2014, 2015, 2016, 2017?');
  js = js.toLowerCase();
  switch (js) {
    case '2016':
    	responses.push(true);
    	console.log('right answer');
    	break;
    case '2014':
        responses.push(false);
    	console.log('wrong answer');
    	break;
    case '2015':
        responses.push(false);
    	console.log('wrong answer');
    	break;
    case '2017':
        responses.push(false);
    	console.log('wrong answer');
    	break;
    default:
    	question4();	
  }
}

question4();

function question5() {

  var firstQuestion = prompt('Is an empty string null? (Yes or No)')

// why do you need to convert the answer to lowercase?
  if (firstQuestion.toLowerCase() === 'yes') {
    firstQuestion = true
  } else if (firstQuestion.toLowerCase() === 'no') {
    firstQuestion = false
  } else {
// what if the user writes something other than yes or no? 
// they will have to answer the question again
    alert("Please answer either Yes or No");
    return question5();
  }
  responses.push(firstQuestion); // add the true or false value to the responses array
}

question5();

function returnScore() {
	alert(responses)
}

returnScore();



