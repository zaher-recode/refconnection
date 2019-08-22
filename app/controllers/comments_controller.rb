class CommentsController < ApplicationController
    
    def index
    end

    def new
        @comment =Comment.new
    end

    def create
        @comment = Comment.create(comment_params.merge(user_id: current_user.id, post_id: @post.id))
    end

   
    def show
    end

    def edit

    end

    def update
    end
    def destroy
    end

   private
   def comment_params
    params.require(:comment).permit(:text)
   end  
end
