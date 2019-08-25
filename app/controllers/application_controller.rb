class ApplicationController < ActionController::Base
    def verify_user
        unless current_user.id == @post.user_id
            redirect_to "/posts" , alert: "You must be the owner of the pet to do that!"
            return true
        end
        return false
    end
    def verify_user_review
        unless current_user.id == @review.user_id
            redirect_to "/posts" , alert: "You must be the owner of the pet to do that!"
            return true
        end
        return false
    end

    def after_sign_in_path_for(resource)
        if current_organization
            org_root_path
        end
    end

    # before_action :configure_permitted_parameters, if: :devise_controller?


end
