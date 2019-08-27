class OrganizationsController < ActionController::Base
    def index
    end

    # def create
    # end

   
    def show
        @organization = Organization.find_by(id: params[:id])
    end

    # def edit

    # end

    # def update
    # end
    # def destroy
    # end

   private
#    def comment_params
#     params.require(:comment).permit(:text, :post_id, :user_id)
#    end  
end