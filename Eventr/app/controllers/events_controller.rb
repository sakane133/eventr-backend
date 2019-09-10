class EventsController < ApplicationController

    def index 
        events = Event.all
        render json: events.to_json(event_serializer_options)
    end

    def create 
        e = Event.create(name: params[:name], event_type:params[:event_type], date:params[:date], budget:params[:budget], num_people:params[:num_people], interests:params[:interests].join(','), user_id:params[:user_id])
        category_num = params[:interests].join('%2C')
        url ="https://www.eventbriteapi.com/v3/events/search/?token=#{Rails.application.credentials.development[:event_brite]}&location.address=DC&categories=#{category_num}&page=2&expand=venue&location.within=30km"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        event_data = JSON.parse(response.body)
        # activities from API
        activities = event_data['events'].sample(6)
        
      new_activities = activities.map{|event|   
      e.activities.create(name: event['name']['text'], link: event['url'], image: event['logo']['original']['url'], category: event['category_id'])}
       render json: e.to_json(event_serializer_options)
    end

    private 

    def event_params
        params.require(:event).permit(:name, :event_type, :date, :budget, :num_people, :interests, :user_id)
    end

    def event_serializer_options
        {:include => {
            :activities => {:except => [:created_at, :updated_at]}
        },
    :except =>[:created_at, :updated_at] }
    end

end
