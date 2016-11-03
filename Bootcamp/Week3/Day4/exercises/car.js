// function Car (model, noise) {
//     this.model     = model;
//     this.noise     = noise;}

// Car.prototype = {
//     wheels: 4,
//     makeNoise: function () {
//         console.log(this.noise)}}

// var ford = new Car('Model T', 'Vrooooom!');

// ford.makeNoise();

function Animal(age) {
    this.age = age;
}

Animal.prototype.sayAge = function() {
    console.log("Hi, my age is " + this.age)
}

function Dog(age) {
    Animal.call(this, age); //call is a function that calls another function
}

Dog.prototype = new Animal(); //needs to be added before instantiation

var dog = new Dog('10 years');

console.log(dog);

dog.sayAge();