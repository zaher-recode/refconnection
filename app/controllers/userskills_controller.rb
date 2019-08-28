class UserskillsController < ApplicationController
    def index

    end

    def new
        @userskills = Userskill.new

    end

    def create
            @userskills = Userskill.new(skill_params.merge(user_id: current_user.id))
        # @userskills = Userskill.new(skill_params.merge(user_id: current_user.id))            
        
        if @userskills.save
            redirect_to(:action => 'show', :id => @skill.id)
        else
            render 'new'
        end


    end

    def show
        @userskills = Userskill.find(params[:id])


    end
    
    # def edit
    #     @userskills = Userskill.find(params[:id])


    # end

    # def update
    #     @userskills = Userskill.find(params[:id])     
    #     if @userskills.update_attributes(skill_params) 
    #       redirect_to(:action => 'show', :id => @skill.id) 
    #     else 
    #       render 'edit' 
    #     end 
    # end

    def destroy
        @userskills = Userskill.find(params[:id])
        unless current_user.id != @userskills.user_id
        @userskills.destroy
        redirect_to action: "index"
        end
    end

    private
    def skill_params
        params.require(:userskill).permit(:skill_id)

    end
end
