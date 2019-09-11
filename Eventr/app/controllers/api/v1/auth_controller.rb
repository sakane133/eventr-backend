class Api::V1::AuthController < ApplicationController

        skip_before_action :authorized, only: [:create]
    
    
        def create
         @user = User.find_by(name: params[:user][:name])
                if @user && @user.authenticate(params[:user][:password])
                    token = encode_token({user_id: @user.id})
                    render json: {user: @user.to_json(user_serializer_options), jwt: token}
                else
                    render json: {error: 'invalid username or password'}, status: :unauthorized
                end
        end
    
        private 
    
        def user_login_params
            params.require(:user).permit(:name, :password)
        end
    
        def user_serializer_options
            {:include => {
                :events => {:except => [:created_at, :updated_at],
                :include => {
                    :activities => {
                        :except => [:created_at, :updated_at],
                         :include => { :activity_events => {
                            :except => [:created_at, :updated_at]
                        }}
                    }
                }}
            },
        :except =>[:created_at, :updated_at] }
        end
    
end
