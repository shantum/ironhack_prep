var fs = require('fs');

function fileActions(err, file) {
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    printEpisodes(episodes);
}

fs.readFile('./Game_of_Thrones.json', 'utf8', fileActions);

// var data = require('./Game_of_Thrones.json')

function printEpisodes(json) {
    json.forEach(function (episode){
        title = "Title:" + episode['title'] + "   "
        ep = 'Episode #:' + episode['episode_number'] + '\n'
        description = episode['description'] + '\n'
        rating = 'Rating:' + episode['rating'] + '  '
        starRating = '*'.repeat(parseInt(episode['rating']))
        result = title + ep + description + rating + starRating
        console.log(result)
    })
}

function printEpisodeIf(json, string) {
    json.forEach(function (episode){
        if (episode.description.indexOf(string) > 0) {
        title = "Title:" + episode['title'] + "   "
        ep = 'Episode #:' + episode['episode_number'] + '\n'
        description = episode['description'] + '\n'
        rating = 'Rating:' + episode['rating'] + '  '
        starRating = '*'.repeat(parseInt(episode['rating']))
        result = title + ep + description + rating + starRating
        console.log(result)
    }
    })
}

// sortedData = data.sort(function (a, b) {
//     return parseInt(a.episode_number) - parseInt(b.episode_number)
// })

// filteredData = data.filter(function(a) {
//     return parseFloat(a.rating) >= 8.5
// })
