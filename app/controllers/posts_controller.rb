class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

    def index
      @posts = Post.order("created_at DESC")
    end

    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.create(post_params)
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path
      else
        render :edit
      end
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy

      flash[:notice] = "La pregunta ha sido eliminado exitosamente"
      redirect_to posts_path
    end

    private
    def post_params
      params.require(:post).permit(:title, :content, :author)
    end

end
