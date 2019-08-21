class JobsController < ApplicationController
    before_action :authenticate_organization!, except: [:show]
    def index
        @jobs = Job.all
        @mine = current_organization.jobs
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.create(job_params.merge(organization_id: current_organization.id))
        if @job.save
            redirect_to(:action => 'show', :id => @job.id)
        else
            render 'new'
        end

    end

   
    def show
        @job = Job.find(params[:id])

    end

    def edit
        @job = Job.find(params[:id])
        
    end

    def update
        # @job = Job.find(params[:id])
        # @job.title = params[:title]
        # @job.description = params[:description]
        # @job.position = params[:position]
        # @job.address = params[:address]
        # @job.salary = params[:salary]
        # @job.save
    
        # redirect_to action: "show", id: @job.id
        @job = Job.find(params[:id]) 
        if @job.update_attributes(job_params) 
          redirect_to(:action => 'show', :id => @job.id) 
        else 
          render 'edit' 
        end 
    
    end
    def destroy
        @job = Job.find(params[:id])
        unless current_organization.id != @job.organization_id
        @job.destroy
        redirect_to action: "index"
        end
    end
   private
   def job_params
    params.require(:job).permit(:title,  :description, :position, :salary, :address, :images)

   end  
end
