class CommentsController < ApplicationController
    def new
    end

    def create
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
    params.require(:comment).permit(:text, :post_id, :user_id)
   end  
end
