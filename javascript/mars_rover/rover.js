var myRover = {
  position: [0,0], 
  direction: 'N'
};

function goForward(rover) {
  switch(rover.direction) {
    case 'N':
      rover.position[0]++
      break;
    case 'E':
      rover.position[1]++
      break;
    case 'S':
      rover.position[0]--
      break;
    case 'W':
      rover.position[1]--
      break;
  };
};

function goBack(rover) {
  switch(rover.direction) {
    case 'N':
      rover.position[0]--
      break;
    case 'E':
      rover.position[1]--
      break;
    case 'S':
      rover.position[0]++
      break;
    case 'W':
      rover.position[1]++
      break;
  };
};

function turnLeft(rover) {
  switch(rover.direction) {
    case 'N':
      rover.direction = 'W'
      break;
    case 'E':
      rover.direction = 'N'
      break;
    case 'S':
      rover.direction = 'E'
      break;
    case 'W':
      rover.direction = 'S'
      break;
  };
};

function turnRight(rover) {
  switch(rover.direction) {
    case 'N':
      rover.direction = 'E'
      break;
    case 'E':
      rover.direction = 'S'
      break;
    case 'S':
      rover.direction = 'W'
      break;
    case 'W':
      rover.direction = 'N'
      break;
  };
};

function roverController (rover, input) {
  for (var i=0; i < input.length; i++) {
    switch(input.charAt(i)) {
      case 'f':
        goForward(rover)
        break;
      case 'b':
        goBack(rover)
        break;
      case 'l':
        turnLeft(rover)
        break;
      case 'r':
        turnRight(rover)   
        break;  
    };

  console.log ("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "]")
  } 
};

function testFunction(string) {
  for (var i=0; i < string.length; i++) {
    console.log(string.charAt(i));
  }
};

console.log('Hello')
roverController(myRover, 'ffbbrrff');
