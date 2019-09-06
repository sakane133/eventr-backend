class EventsController < ApplicationController

    def index 
        events = Event.all
        render json: events.to_json(event_serializer_options)
    end

    private 

    def event_params
        params.require(:event).permit(:name, :password)
    end

    def event_serializer_options
        {:include => {
            :activitiesg => {:except => [:created_at, :updated_at]}
        },
    :except =>[:created_at, :updated_at] }
    end

end
