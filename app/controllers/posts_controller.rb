class PostsController < ApplicationController


  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all  
  end

  def new
    @post = Post.new
  end 

  def create
    @post = Post.new(params.require(:post).permit!)
    if @post.save
      flash.now[:notice]= "The post was created Successfully"
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit!)
      flash[:notice]= "Post Updated succeffully"
    else 
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


end 