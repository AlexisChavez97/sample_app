class MemesController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]

  def index
    @memes = Meme.all || []
  end

  def new
    @meme = Meme.new
    @categories = Category.all.map { |c| [c.name, c.id] }.to_h
  end

  def show
    @meme = Meme.find(params[:id])
  end

  def create
    @meme = current_user.memes.build(meme_params)
    # @meme.category_ids = params[:category_id]
    if @meme.save
      flash[:success] = 'Meme was succesfully added'
      redirect_to memes_path
    else
      render 'memes/new'
    end
  end

  def edit
    @meme = Meme.find(params[:id])
  end

  def update
    @meme = Meme.find(params[:id])
    if @meme.update_attributes(meme_params)
      flash[:success] = 'Meme updated'
      redirect_to @meme
    end
  end

  def destroy
    @meme = Meme.find(params[:id])
    if @meme.destroy
      flash[:success] = 'Deleted succesfully'
      redirect_to memes_path
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:picture, :caption, :name)
  end
end
