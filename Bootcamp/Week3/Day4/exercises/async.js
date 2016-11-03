// function async(callback) {
//     //takes 25 seconds
//     callback(result)
// }

// var result = async(handleAsyncResponse);
// //same as
// var result = async(function (result) {
//     console.log(result)
// })

// function sync() {
// }

// function handleAsyncResponse(result) {
//     console.log(result)
// }

// handleAsyncResponse(result)



function shout() {
    console.log('Ahhhh!')
}

var sleep = function sleep(seconds, callback) {
    setTimeout(callback, seconds*1000)
}

sleep(10, function() {
    console.log('its been 10 seconds.')
})

