var artistInfo = [];
var albums = [];

$(document).ready(function() {
    $('#submit').click(function(e) {
        e.preventDefault();
        var search_query = $('#artist').val()
        //put functions here
        spotifyArtistSearch(search_query);
    });


});

function spotifyArtistSearch(query) {
  $.ajax({
    type: "GET",
    dataType: 'json',
    url: "https://api.spotify.com/v1/search?q=" + query + "&type=artist",
    success: getArtists,
    error: throwError
  })
}

function getArtists(response) {
  var result = response.artists.items;
  showArtistInfo(result);
  storeArtistInfo(result);
}

function throwError(error) {
  console.log('error!')
  console.log(error.responseText)
}

function showArtistInfo(res) {
  $.each(res, function(){
      $('#results_table').append("<tr><td><a class='albums'>" + this.name + "</a></td><td><img src=" + this.images[0].url + " width=150px height=150px></img></td></tr>");
  })
}

function storeArtistInfo(res) {
  $.each(res, function(){
    artistInfo.push({name: this.name, id: this.id, img_url: this.images[0].url});
  });
  console.log(artistInfo);
}

function spotifyAlbumSearch(artist_id){
  $.ajax({
    type: "GET",
    dataType: 'json',
    url: "https://api.spotify.com/v1/artists/" + artist_id + "/albums",
    success: getAlbums,
    error: throwError
  })
}
