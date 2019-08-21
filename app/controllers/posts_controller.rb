class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    def index
        @posts = Post.all
        @mine = current_user.posts
    end


    def new
    end

    def create
        puts"###############################################"
        p params
        @post =Post.create(title: params[:title], description: params[:description],category_id: params[:category_id], user_id: current_user.id, images: params[:images])
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
        @post = Post.find(params[:id])
        @post.title = params[:title]
        @post.description = params[:description]
        @post.category_id = params[:category_id]
        if params[:images]
        @post.images.attach(params[:images])
        end
        @post.save
    
        redirect_to action: "show", id: @post.id  
    
    end
    def destroy
        @post = Post.find(params[:id])
        unless verify_user
        @post.destroy
        redirect_to action: "index"
        end
    end

#    private
#    def post_params
#     params.require(:post).permit(:title,  :description, :category_id,:user_id,:images)

#    end  
end
