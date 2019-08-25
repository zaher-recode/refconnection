class ReviewsController < ApplicationController
   
    def index
    end
    def new
        @review = Review.new
    end
    def create
        # puts "###################$$$$$$$$$$$$$$$$$$$$$$$$$"
        @review =Review.create(review_params.merge( user_id: current_user.id))
        Post.find(@review.post_id).add_rating(@review.rating)
        redirect_to "/posts/#{@review.post_id}"
    end


        

    def edit
        @review = Review.find(params[:id])
        verify_user_review
    end

    def update
        @review = Review.find(params[:id])
        respond_to do |format|
            if @review.update(review_params)
                format.html { redirect_to "/posts/#{@review.post_id}", notice: 'Review was successfully updated.' }
                format.json { render :show, status: :created, location: @review }

            else
                format.html { render :new }
                format.json { render json: @review.errors, status: :unprocessable_entity }
            end
        end
    
    end

    def destroy
        @review = Review.find(params[:id])
        unless verify_user_review
        @review.destroy
        redirect_to "/posts/#{@review.post_id}"
        end
    end

   private
   def review_params
    params.require(:review).permit(:title,  :text, :rating, :post_id)
   end  
end
