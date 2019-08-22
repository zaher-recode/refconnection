class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    def index
        @posts = Post.all.order("created_at DESC")
            if current_user
            @mine = current_user.posts
        end
    end


    def new
        @post = Post.new

    end

    def create
        
        @post =Post.create(post_params.merge(user_id: current_user.id))
        # @post.images = params[:post][:images]
        redirect_to action: "show", id: @post.id  
    end

    def show
        @review =Review.new
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
        if params[:post][:images]
            @post.images.attach(params[:post][:images])
        end
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
    params.require(:post).permit(:title,  :description, :category_id,:images)
   end  
end
