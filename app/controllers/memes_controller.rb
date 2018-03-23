class MemesController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]

  def index
    @memes = Meme.all || []
  end

  def new
    @meme = Meme.new
  end

  def show
    @meme = Meme.find_by(params[:id])
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

  def edit
    @meme = Meme.find_by(params[:id])
  end

  def update
    @meme = Meme.find_by(params[:id])
    if @meme.update_attributes(meme_params)
      flash[:success] = 'Meme updated'
      redirect_to
  end
end

  def destroy
    @meme = Meme.find_by(params[:id])
    @meme.destroy
    if @meme.destroy
      flash[:success] = 'Deleted succesfully'
      redirect_to memes_path
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:picture, :caption)
  end
end
