class ReviewsController < ApplicationController
   
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
   def review_params
    params.require(:review).permit(:title,  :text, :rating, :post_id, :user_id)
   end  
end
