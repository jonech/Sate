class EventsController < ApplicationController

    def new
    end

    def create
        # temporary upload image to public/uploads dir
        if (params[:event][:cover_photo] != nil)
            uploaded_io = params[:event][:cover_photo]
            File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file| 
                file.write(uploaded_io.read)
            end
        end

        # handle file uploads

        # handle saving entry to ActiveRecord
        @event = Event.new
        @event.name = params[:event][:name]
        @event.place = params[:event][:place]
        @event.description = params[:event][:description] 
        @event.organisation = params[:event][:organisation]
        @event.end_time = params[:event][:end_time]

        @event.save

        # render plain: params[:event].inspect
        redirect_to @event
    end

    def index
        @events = Event.all
    end

    def show
        event = Event.find_by(id: params[:id])
        @event = event
        #@comments = @event.comments.all
        @event_hash = {}
        event.instance_variables.each_with_object({}) {|var, hash| hash[var.to_s.delete("@")] = event.instance_variable_get(var)}
    end
end

# gift.instance_variables.each_with_object({}) { |var, hash| hash[var.to_s.delete("@")] = gift.instance_variable_get(var) }
