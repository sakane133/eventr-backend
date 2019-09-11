class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def show
        token = request.headers["Authentication"].split(" ")[1]
        render json: User.find(decode(token)["user_id"]), status: :accepted
    end

def profile
    render json:  {user: @user.to_json(user_serializer_options)}, status: :accepted
end

    def create
            @user = User.create(user_params)
            if @user.valid?
                @token = encode_token(user_id: @user.id)
                render json: {user: @user.to_json(user_serializer_options), jwt: @token}, status: :created
            else
                render json: {error: 'failed to create user'}, status: :not_acceptable
            end
    end

    private 

    def user_params
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
