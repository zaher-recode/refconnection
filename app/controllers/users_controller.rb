class UsersController < ApplicationController
    def index
    end

    def create
    end

   
    def show
        @user = User.find_by(id: params[:id])
        @user_posts = Post.where(user_id:@user.id)
    end

    def edit

    end

    def update
    end
    def destroy
    end

#    private
#    def user_params
#     params.require(:user).permit()
#    end  
end