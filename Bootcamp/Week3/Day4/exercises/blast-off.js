     //countdown from 10 to 0 every second and then show blast off

  //create a function which waits for 1 second and then logs the seconds
//if seconds = 0; it should log blast off

  //this function calls a another function after the time supplied in seconds
//we want to execute a function every second
function blastOff(time) {
    //setup the function to return blast off if time =0
    if (time == 0) {
        console.log('Blast Off!')
        return
    }

    //and to log the time if not 0
    console.log(time)

    //and then set a timeout to call this function every
  // second and reduce the value of time by one each time
//recursion is used here
    setTimeout(function() {
        blastOff(time - 1)
    }, 1000)
}


//call the blastoff function
blastOff(5);