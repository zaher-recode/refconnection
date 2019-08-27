class AttendeesController < ApplicationController
    before_action :find_event

    def index
        @attendees = Attendee.where(event_id: params[:id]).order("created_at DESC")
    end

   

    def create
        @attendee =Attendee.create(event_id: params[:id], user_id: current_user.id)
        
    end
   

    def destroy
        @attendee = Attendee.where(event_id: params[:id],user_id: current_user.id)
        unless verify_user
        @event.destroy
        end
    end
    private
    def attendee_params
     params.require(:attendee).permit(:event_id)
    end  
    def find_event
        @event = Event.find(params[:post_id])
    end
    
end
