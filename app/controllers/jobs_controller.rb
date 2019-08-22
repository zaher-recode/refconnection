class JobsController < ApplicationController
    before_action :authenticate_organization!, except: [:show, :index]
    before_action :authenticate_user!, except: [:show, :index]

    def index
        @jobs = Job.all
        @mine = current_organization.jobs
    end

    def new
    end

    def create
        @job =Job.create(title: params[:title], description: params[:description],position: params[:position], organization_id: current_user.id, address: params[:address], salary: params[:salary])
        redirect_to action: "show", id: @job.id  
    end

   
    def show
        @job = Job.find(params[:id])
    end

    def edit
        @job = Job.find(params[:id])
        verify_user
    end

    def update
        @job = Job.find(params[:id])
        @job.title = params[:title]
        @job.description = params[:description]
        @job.position = params[:position]
        @job.address = params[:address]
        @job.salary = params[:salary]
        @job.save
    
        redirect_to action: "show", id: @job.id  
    
    end
    def destroy
        @job = Job.find(params[:id])
        unless verify_user
        @job.destroy
        redirect_to action: "index"
        end
    end
   private
   def job_params
    params.require(:job).permit(:title,  :description, :position, :salary, :address)

   end  
end
