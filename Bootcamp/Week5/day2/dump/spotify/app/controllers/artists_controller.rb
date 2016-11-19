class ArtistsController < ApplicationController
  def search
    @artists = Artist.all
  end
end
