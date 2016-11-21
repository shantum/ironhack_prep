class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
    render(:index)
  end

  def show
    @tournaments = Tournament.all
    render json: @tournaments
  end

  def show_id
    @tournament = Tournament.find_by(id: params[:id])
    render json: @tournament
  end

  def create
    @tournament = Tournament.create(tournament_params)
    render json: @tournament
  end

  def destroy
    @tournament = Tournament.find_by(id: params[:id])
    unless @tournament
      render json: {error: "tournament not found"},
        status: 404
      return
    end
    @tournament.destroy
    render json: @tournament
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
