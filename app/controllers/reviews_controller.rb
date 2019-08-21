class ReviewsController < ApplicationController
   
    

    def create
        @review =Review.create(title: params[:title], text: params[:text],post_id: @post.id, user_id: current_user.id, rating: params[:rating])
    end

   

    def edit
        @review = Review.find(params[:id])
        verify_user
    end

    def update
        @review = Review.find(params[:id])
        @review.title = params[:title]
        @review.text = params[:text]
        @review.rating = params[:rating]
        @review.save
    
        redirect_to action: "show", id: @job.id  
    end

    def destroy
        @review = Review.find(params[:id])
        unless verify_user
        @review.destroy
        redirect_to action: "index"
        end
    end

   private
   def review_params
    params.require(:review).permit(:title,  :text, :rating, :post_id, :user_id)
   end  
end
