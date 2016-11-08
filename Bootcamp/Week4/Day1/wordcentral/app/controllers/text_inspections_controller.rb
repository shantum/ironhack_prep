class TextInspectionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    @text = params[:text_inspection][:user_text].inspect
    @word_count = @text.split(' ').length
    @read_speed = 200
    @results = (@word_count/@read_speed).to_f

    render "results"
  end

end
