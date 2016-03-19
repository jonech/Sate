class PictureController < ApplicationController
	before_action :set_event, only: [:like_content]

    def display_pictures
        @events = Event.all

        respond_to do |format|
            format.html {render template: "test_picture"}
        end

    end

    def like_content
    	incremented = @event.like + 1
    	@event.update(like: incremented)
    	respond_to do |format|
    		format.js
    	end
    end

    private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_event
	      @event = Event.find(params[:id])
	    end

end