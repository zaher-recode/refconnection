class UsersController < ApplicationController

    # FOR SEARCHKICK
    def search  
        if params[:search].blank?  
          redirect_to(root_path, alert: "Empty field!") and return  
        elsif Post.all.empty? && Event.all.empty?  && Job.all.empty?  && Organization.all.empty?  && User.all.empty? 
          redirect_to(root_path, alert: "Empty DB!") and return  
        else  
            search = params[:search].present? ? params[:search] : nil
            @search_text = params[:search]
            if search
                @search_posts = Post.search(search)
                @search_events = Event.search(search)
                @search_jobs = Job.search(search)
                @search_orgs = Organization.search(search)
                @search_users = User.search(search)
            else
                nil
            end
        end
    end 

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