function ArtistController(){};
function AlbumController(){};
function TrackController(){};

function SpotifyController() {
  this.artistController = new ArtistController();
  this.albumController = new AlbumController();
  this.trackController = new TrackController();
}

SpotifyController.prototype = {
  makeAjax: function(){
    $.ajax({
      type: 'GET',
      url: this.url,
      success: this.successFunction.bind(this),
      error: this.handleError
    })
  },

  handleError: function() {
    console.log(error);
  }
}

ArtistController.prototype = new SpotifyController();
AlbumController.prototype = new SpotifyController();
TrackController.prototype = new SpotifyController();
