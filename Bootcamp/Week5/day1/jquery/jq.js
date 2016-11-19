

var phrases = [
  'this is the first phrase',
  'this one is the second',
  'this one the third',
  'wanted a fourth phrase?'
]

function phraseCycle() {
  //set i=0 for phrase cycle
  i=0;
  
  //cycles phrases
  $('#js-button').click(function(){
    $('#js-p').text(phrases[i])
    i++;
    if (i == phrases.length) {i=0};
  }); 
};

function showPhrases() {
  //shows current phrases in array
  phrases.forEach(function(phrase){
    $('#phraseList').append("<p class='phrase'>" + phrase + '</p>')
  });
};

function newPhraseButton() {
  $('#newPhraseButton').click(function(event) {
    event.preventDefault();
    phrases.push($('#newPhrase').val())
    $('#phraseList').empty()
    showPhrases();
  })
}

function newPhraseSubmit() {
  $('#newPhrase').submit(function(event) {
    event.preventDefault();
    phrases.push($('#newPhrase').val())
    $('#phraseList').empty()
    showPhrases();
  })
}

function deletePhrase() {
  $('.phrase').click(function(){
    
  })
  };

$(document).ready(function(){
  phraseCycle();
  newPhraseButton();
  newPhraseSubmit();
  deletePhrase();
  showPhrases();
})

console.log('js is ready')