class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created"
      redirect_to @post 
    else
      flash[:alert] = "You must add an image!"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      flash[:alert] = "Error"
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
