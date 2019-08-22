class CommentsController < ApplicationController
    
    def index
        @comment = Comment.all
    end

    def new
       
    end

    def create
        @comment = Comment.create(comment_params.merge(user_id: current_user.id))
        @post = Post.find(@comment.post_id) 

        if @comment.save
            redirect_to post_path(@post)

        # redirect_to action: "/posts/#{@comment.post_id}", id: @comment.id
        else
            render "new"
        end

    end

   
    def show
        @comment = Comment.find(params[:id])

    end

    def edit
        @comment = Comment.find(params[:id])


    end

    def update
        @comment = Comment.find(params[:id]) 
        @post = Post.find(@comment.post_id) 
        if @comment.update_attributes(comment_params) 
        redirect_to post_path(@post)
        #   redirect_to action: "/posts/#{@comment.post.id}", id: @comment.id
        else 
          render 'edit' 
        end 
    end
    def destroy
        @comment = Comment.find(params[:id])
        @post = Post.find(@comment.post_id) 
        unless current_user.id != @comment.user_id
        @comment.destroy
        redirect_to post_path(@post)
        # redirect_to action: "/posts/#{@comment.post_id}"
        end
    end

   private
   def comment_params
    params.require(:comment).permit(:text, :post_id)
   end  
end
