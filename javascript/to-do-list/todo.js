
window.onload = function() {

// the following code adds event listeners to the buttons
// you'll learn more about this later
// for this exercise, you are going to write the functions for
// what happens when the user clicks on the buttons.
  var saveButton = document.getElementById('save-button');
  saveButton.addEventListener('click', addToDoItem, false);

  var doneButton = document.getElementById('done-button');
  doneButton.addEventListener('click', markAsDone, false);


  function addToDoItem() {
  var input = document.getElementById("todo-input").value;
  var newEntry = document.createElement("li")
  var todoList = document.getElementById("todo-list-items");
  newEntry.appendChild(document.createTextNode(input));
  todoList.appendChild(newEntry);
    }

  function markAsDone() {
    doneItem = document.getElementById("todo-list-items")

  }}
