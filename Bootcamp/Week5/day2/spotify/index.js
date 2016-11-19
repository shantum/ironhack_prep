function ArtistController(){};
function AlbumController(){};
function TrackController(){};

function SpotifyController(){
  this.artistController = new ArtistController();
  this.albumController = new AlbumController();
  this.trackController = new TrackController();
}

SpotifyController.prototype = {
  makeAjax: function(){
    $.ajax({
      type: "GET",
      url: this.url,
      success: this.successFunction.bind(this),
      error: this.handleError
    })
  },
  handleError: function(){
    console.log(error);
  }
}

var spotifyController = new SpotifyController();

ArtistController.prototype = new SpotifyController();
AlbumController.prototype = new SpotifyController();
TrackController.prototype = new SpotifyController();

ArtistController.prototype.searchArtist = function(){
  $("#query_submit").click(function(event){
    $('#showArtists').empty();
    event.preventDefault();
    var searchTerm = $('input').val()
    this.url = "https://api.spotify.com/v1/search?type=artist&query=" + searchTerm;
    this.makeAjax();
    return false
  }.bind(this))
};

ArtistController.prototype.successFunction = function(response){
  response.artists.items.forEach(this.renderArtists)
  $('img').click(function(event){
    $(".modal-body").empty();
    spotifyController.albumController.url = "https://api.spotify.com/v1/artists/" + event.currentTarget.id + "/albums"
    spotifyController.albumController.makeAjax();
  })
};

ArtistController.prototype.renderArtists = function(artist){
    var imgSrc = artist.images[0] == undefined? "https://s.discogs.com/images/default-release.png": artist.images[0].url;
    var img = $($("<img>").attr("src", imgSrc).attr("id", artist.id)).attr("data-toggle", "modal").attr("data-target", "#myModal")
    var artistDiv = $('<div>').append([($("<h1>")).text(artist.name), img])
    $("#showArtists").append(artistDiv);
  };


AlbumController.prototype.successFunction = function(response){
  response.items.forEach(this.renderAlbums)
  $("div.album").click(function(event){
    $(".modal-body").empty();
    spotifyController.trackController.url = "https://api.spotify.com/v1/albums/" + event.currentTarget.id + "/tracks"
    spotifyController.trackController.makeAjax()
  })
}

AlbumController.prototype.renderAlbums = function(album){
  var albumDiv = $("<div>").attr("class", "album").attr("id", album.id);
  var imgSrc = album.images[0] == undefined? "https://s.discogs.com/images/default-release.png" : album.images[0].url;
  var img = $($("<img>").attr("src", imgSrc).attr("class", "img-album"))
  albumDiv.append([$("<p>").text(album.name), img ]);
  $(".modal-body").append(albumDiv)
}

TrackController.prototype.successFunction = function(response){
  response.items.forEach(this.renderTracks)
}

TrackController.prototype.renderTracks = function(track){
  $(".modal-body").append([$("<a>").text(track.name).attr("target","_blank").attr("href", track.preview_url), $("<br>")])
}

$(document).ready(function(){
var spotifyController = new SpotifyController();
spotifyController.artistController.searchArtist();
})
