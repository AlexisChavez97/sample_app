class MemesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def index
    @memes = Meme.all || []
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = current_user.memes.build(meme_params)
    if @meme.save
      flash[:success] = 'Meme was succesfully added'
      redirect_to memes_path
    else
      render 'memes/new'
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:picture, :caption)
  end
end
