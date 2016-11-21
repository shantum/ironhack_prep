class IngredientsController < ApplicationController
  def index
    sandwiches = Ingredient.all
    render json: sandwiches
  end

  def create
    sandwich = Ingredient.create(sandwich_params)
    render json: sandwich
  end

  def show
    sandwich = Ingredient.find_by(id: params[:id])
    unless sandwich
      render json: {error: "sandwich not found"},
        status: 404
      return
    end
    render json: sandwich
  end

  def update
    sandwich = Ingredient.find_by(id: params[:id])
    unless sandwich
      render json: {error: "sandwich not found"},
        status: 404
      return
    end
    sandwich.update(sandwich_params)
    render json: sandwich
  end

  def destroy
    sandwich = Ingredient.find_by(id: params[:id])
    unless sandwich
      render json: {error: "sandwich not found"},
        status: 404
      return
    end
    sandwich.destroy
    render json: sandwich
  end

  private

  def sandwich_params
    params.require(:sandwich).permit(:name, :bread_type)
  end

end
