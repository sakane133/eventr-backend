class ActivitiesController < ApplicationController

        def create
        #     category_num = params[:category].join('%2C')
        #     url ="https://www.eventbriteapi.com/v3/events/search/?token=#{Rails.application.credentials.development[:event_brite]}&location.address=DC&categories=#{category_num}&page=2&expand=venue&location.within=20km"
        #     uri = URI.parse(url)
        #     response = Net::HTTP.get_response(uri)
        #     event_data = JSON.parse(response.body)
        #     # activities from API
        #     activities = event_data['events'].sample(6)
          
            
        #   new_activities = activities.map{|event|   
        #   Activity.create(name: event['name']['text'], link: event['url'], image: event['logo']['original']['url'], category: event['category_id'])}
        #     render json: new_activities
            
        end
    
        def index
          
        end

        def generate
                if  params[:_json][0].length > 0
                        params[:_json][0].map{|act|
                                a = Activity.find(act[:id])
                                a.destroy 
                                }
                end
                category_num = params[:_json][1][:interests].split(',').join('%2C')
                url ="https://www.eventbriteapi.com/v3/events/search/?token=#{Rails.application.credentials.development[:event_brite]}&location.address=DC&categories=#{category_num}&page=2&expand=venue&location.within=30km"
                uri = URI.parse(url)
                response = Net::HTTP.get_response(uri)
                event_data = JSON.parse(response.body)
                # activities from API
                activities = event_data['events'].sample(6)
            
                e = Event.find(params[:_json][1][:id])
                new_activities = activities.map{|event|   
                e.activities.create(name: event['name']['text'], link: event['url'], image: event['logo']['original']['url'], category: event['category_id'])}
                render json: e.activities.to_json(activity_serializer_options)

               
            end

            private

            def activity_serializer_options
                {:include => {
                    :activity_events => {:except => [:created_at, :updated_at]}
                },
            :except =>[:created_at, :updated_at] }
            end
      

    


    
end
