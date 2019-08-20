class EventsController < ApplicationController
    def index
    end

    def new
    end

    def create
    end

   
    def show
    end

    def edit

    end

    def update
    end
    def destroy
    end

   private
   def event_params
    params.require(:event).permit(:title,  :description, :start_date, :end_date, :organization_id, :address)
   end  
end
