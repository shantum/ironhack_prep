var Viking = function (name, age, strength) {
    this.name = name;
    this.age = age;
    this.strength = strength;
}

var Saxon = function () {
    randomNum = Math.floor((Math.random() * 10) + 1);
    this.health = randomNum;
    this.strength = randomNum;
}

viking1 = new Viking('Asgard', 10, 100);
viking2 = new Viking('Asswipe', 10, 80);
saxon1 = new Saxon;
saxon2 = new Saxon;

console.log(saxon1.strength)
console.log(saxon2.strength)


function pitFight(viking1, viking2) {
    if (viking1.strength > viking2.strength) {
        viking2.strength = viking2.strength * 0.5
    } else {
        viking1.strength = viking1.strength * 0.5
    }
    console.log(viking1.strength)
    console.log(viking2.strength)
}
