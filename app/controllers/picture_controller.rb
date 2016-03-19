class PictureController < ApplicationController

    def display_pictures
        @pictures = Event.select("imageurl")

        respond_to do |format|
            format.html {render template: "test_picture"}
        end

    end
end