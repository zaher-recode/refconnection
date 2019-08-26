class EventsController < ApplicationController
    before_action :authenticate_organization!, except: [:show, :index,:attend]
    # before_action :authenticate_user!, except: [:show, :index]

    # def attend
    #     # byebug
    #     @event = Event.find_by(id: params[:event_id] )
    #     @attend = Attendee.new(user_id: params[:user_id], event_id: @event.id)
    #     respond_to do |format|
    #         if @attend.save
    #             format.html { redirect_to @event, notice: "You are attending to #{@event.title}" }
    #             format.json { render :show, status: :created, location: @event }
    #         else
    #             format.html { render :show }
    #             format.json { render json: @event.errors, status: :unprocessable_entity }
    #         end
    #     end
    # end

    # def attend?
    #     @event = Event.find_by(id:params[:id] )
    #     @attend = @event.attendees.build(user_id: current_user.id, event_id: @event.id)
    #     respond_to do |format|
    #         if @attend.save
    #             format.html { redirect_to @event, notice: "You are attending to #{@event.title}" }
    #             format.json { render :show, status: :created, location: @event }
    #         else
    #             format.html { render :new }
    #             format.json { render json: @event.errors, status: :unprocessable_entity }
    #         end
    #     end
    # end


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
        # @event.images = params[:post][:images]
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
        @comment = Comment.new
        @comments = @event.comments.order("created_at DESC")
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
