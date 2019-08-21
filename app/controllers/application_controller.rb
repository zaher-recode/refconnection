class ApplicationController < ActionController::Base
    def verify_user
        unless current_user.id == @post.user_id
            redirect_to "/posts" , alert: "You must be the owner of the pet to do that!"
            return true
        end
        return false
    end

    # before_action :configure_permitted_parameters, if: :devise_controller?


end
