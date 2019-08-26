class ExperiencesController < ApplicationController
    def index

    end

    def new
        @experience = Experience.new

    end

    def create
        @experience = Experience.create(experience_params.merge(user_id: current_user.id))
        if @experience.save
            redirect_to(:action => 'show', :id => @experience.id)
        else
            render 'new'
        end


    end

    def show
        @experience = Experience.find(params[:id])


    end
    
    def edit
        @experience = Experience.find(params[:id])


    end

    def update
        @experience = Experience.find(params[:id])     
        if @experience.update_attributes(experience_params) 
          redirect_to(:action => 'show', :id => @experience.id) 
        else 
          render 'edit' 
        end 
    end

    def destroy
        @experience = Experience.find(params[:id])
        unless current_user.id != @experience.user_id
        @experience.destroy
        redirect_to action: "index"
        end
    end

    private
    def experience_params
        params.require(:experience).permit(:title, :company, :location, :current_working_role, :start_date, :end_date, :description, :industry_id)

    end
end
