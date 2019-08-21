class CategoriesController < ApplicationController
    # this is for collecting the posts with a certain category
    def index
        @posts = Post.where(category_id: params[:id])
    end

    def create
    end

    def destroy
    end

   private
   def category_params
    params.require(:category).permit(:name)
   end  
end
