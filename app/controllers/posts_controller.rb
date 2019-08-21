class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    def index
        @posts = Post.all
        @mine = current_user.posts
    end


    def new
        @post = Post.new
    end

    def create
        @post =Post.create(post_params.merge(user_id: current_user.id))
        @post.images = params[:post][:images]
        redirect_to action: "show", id: @post.id  
    end

   
    def show
        @post = Post.find(params[:id])
        @reviews = Review.where(post_id: @post.id).order("created_at DESC")
        @comments = Comment.where(post_id: @post.id).order("created_at DESC")
    end

    def edit
        @post = Post.find(params[:id])
        verify_user
    end

    def update
        byebug
        @post = Post.find(params[:id])
        @post.images = params[:post][:images]
        respond_to do |format|
            if @post.update(post_params)
                format.html { redirect_to @post, notice: 'Post was successfully updated.' }
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :new }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end
    def destroy
        @post = Post.find(params[:id])
        unless verify_user
        @post.destroy
        redirect_to action: "index"
        end
    end

   private
   def post_params
    params.require(:post).permit(:title,  :description, :category_id)
   end  
end
