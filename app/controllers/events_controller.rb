class EventsController < ApplicationController
    def new
    end

    def create
        # temporary upload image to public/uploads dir
        uploaded_io = params[:event][:cover_photo]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file| 
            file.write(uploaded_io.read)
        end

        # handle saving entry to ActiveRecord
        @event = Event.new
        @event.name = params[:event][:name]
        @event.place = params[:event][:place]
        @event.description = params[:event][:description] 
        @event.organisation = params[:event][:organisation]
        @event.end_time = params[:event][:end_time]

        # render plain: params[:event].inspect
        redirect_to @event
    end

    def index
    end

    def show
    end
end
