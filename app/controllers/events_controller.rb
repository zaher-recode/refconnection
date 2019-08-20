class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    def index
        @events = Event.all
        @mine = current_user.jobs
    end

    def new
    end

    def create
        @event =Event.create(title: params[:title], description: params[:description], organization_id: current_user.id, address: params[:address], start_date: params[:start_date],end_date: params[:end_date], images: params[:images])
        redirect_to action: "show", id: @event.id  
    end

   
    def show
        @event = Event.find(params[:id])
    end

    def edit
        @event = Event.find(params[:id])
        verify_user
    end

    def update
        @event = Event.find(params[:id])
        @event.title = params[:title]
        @event.description = params[:description]
        @event.start_date = params[:start_date]
        @event.address = params[:address]
        @event.end_date = params[:end_date]
        if params[:images]
            @event.images.attach(params[:images])
            end
        @event.save
    
        redirect_to action: "show", id: @event.id  
    
    end
    def destroy
        @event = Event.find(params[:id])
        unless verify_user
        @event.destroy
        redirect_to action: "index"
        end
    end

   private
   def event_params
    params.require(:event).permit(:title,  :description, :start_date, :end_date, :address)
   end  
end
