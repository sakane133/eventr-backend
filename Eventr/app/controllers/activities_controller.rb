class ActivitiesController < ApplicationController

        def create
            category_num = params[:category].join('%2C')
            url ="https://www.eventbriteapi.com/v3/events/search/?token=B2CKPKT3S7X4PJATZ3KJ&location.address=DC&categories=#{category_num}&page=2&expand=venue&location.within=20km"
            uri = URI.parse(url)
            response = Net::HTTP.get_response(uri)
            event_data = JSON.parse(response.body)
            selected_events = event_data['events'].sample(6)
            byebug

            activities = Activity.all
            render json: activities
            
        end
    
        def index
            activities = Activity.all
            render json: activities 
        end
      

    


    
end
