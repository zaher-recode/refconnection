class SkillController < ApplicationController
    def index

    end

    def new
        @skill = Skill.new

    end

    def create
        @skill = Skill.create(skill_params.merge(user_id: current_user.id))
        if @skill.save
            redirect_to(:action => 'show', :id => @skill.id)
        else
            render 'new'
        end


    end

    def show
        @skill = Skill.find(params[:id])


    end
    
    def edit
        @skill = Skill.find(params[:id])


    end

    def update
        @skill = Experience.find(params[:id])     
        if @skill.update_attributes(skill_params) 
          redirect_to(:action => 'show', :id => @skill.id) 
        else 
          render 'edit' 
        end 
    end

    def destroy
        @skill = Skill.find(params[:id])
        unless current_user.id != @skill.user_id
        @sill.destroy
        redirect_to action: "index"
        end
    end

    private
    def skill_params
        params.require(:skill).permit(:title, :company, :location, :current_working_role, :start_date, :end_date, :description, :industry_id)

    end
end
