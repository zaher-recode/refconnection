class JobsController < ApplicationController
    before_action :authenticate_organization!, except: [:show, :index]    

    def index
        @job = Job.new
        if current_organization
            @jobs = current_organization.jobs  
        else
            @jobs = Job.all.order('created_at DESC')
        end

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
   
        @job = Job.find(params[:id]) 
        @job = Job.find(params[:id])
        if params[:job][:images]
            @job.images.attach(params[:job][:images])
        end
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
