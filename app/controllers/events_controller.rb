class EventsController < ApplicationController
    before_action :authenticate_organization!, except: [:show, :index]
    before_action :authenticate_user!, except: [:show, :index]

    def index
        @events = Event.all
        # @mine = current_organization.events
    end

    def new
        @event = Event.new
    end

    def create
        @event =Event.create(event_params.merge(organization_id: current_organization.id))
        @event.images = params[:post][:images]
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
    end

    def update
        @event = Event.find(params[:id])
        @event.images = params[:post][:images]
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
        unless verify_user
        @event.destroy
        redirect_to action: "index"
        end
    end

   private
   def event_params
    params.require(:event).permit(:title,  :description, :start_date, :end_date, :address, :images)
   end  
end
