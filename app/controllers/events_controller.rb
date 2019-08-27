class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:attend]
    # before_action :authenticate_organization!, except: [:show, :index,:attend]


    # before_action :authenticate_user!, except: [:show, :index]



    
    def attend

        @event = Event.find(params[:id])
        if attending?
            @text = "unattended"
          else
        @attendee =@event.attendees.create(user_id: current_user.id)
        @text = "attending"
        end
        redirect_to event_path(@event)
    end

    def unattend
        
        @event = Event.find(params[:id])
        @attend = Attendee.find_by(event_id: @event.id, user_id: current_user.id)
        @attend.destroy
        redirect_to event_path(@event)

    end


    def index
        @events = Event.all.order('created_at DESC')
        @event = Event.new
        # @mine = current_organization.events
    end

    def new
        @event = Event.new
    end

    def create
        @event =Event.create(event_params.merge(organization_id: current_organization.id))
        @event.images.attach(params[:event][:images])
        respond_to do |format|
            if @event.save
                format.html { redirect_to @event, notice: 'Event was successfully created.' }
                format.json { render :show, status: :created, location: @event }
            else
                format.html { render :new }
                format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end
    end

   
    def show
        @event = Event.find(params[:id])
    end

    def edit
        @event = Event.find(params[:id])
        if @event.organization_id != current_organization.id
            redirect_to event_path(@event), alert: "you don't have permision."
        end
    end

    def update
        @event = Event.find(params[:id])
        if params[:event][:images]
            @event.images.attach(params[:event][:images])
        end        
        respond_to do |format|
            if @event.update(event_params)
                format.html { redirect_to @event, notice: 'Event was successfully updated.' }
                format.json { render :show, status: :created, location: @event }
            else
                format.html { render :new }
                format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @event = Event.find(params[:id])
        if current_organization == @event.organization
        @event.destroy
        redirect_to action: "index"
        end
    end

   private
   def event_params
    params.require(:event).permit(:title,  :description, :start_date, :end_date, :address, :images)
   end  
   def attendee_params
    params.require(:attendee).permit(:event_id)
   end  
   def attending?
    Attendee.where(user_id: current_user.id, event_id: params[:event_id]).exists?
end
end
