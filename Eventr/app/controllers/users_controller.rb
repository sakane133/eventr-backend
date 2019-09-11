# class UsersController < ApplicationController
#     skip_before_action :authorized, only: [:create]

#     def index 
#         users = User.all
#         render json: users.to_json(user_serializer_options)
#     end

#     def show
#         # user = User.find(params[:id])
#         token = request.headers["Authentication"].split(" ")[1]
#         render json: User.find(decode(token)["user_id"]), status: :accepted
#         # render json: user.to_json(user_serializer_options)
#     end

#     private 

#     def user_params
#         params.require(:user).permit(:name, :password)
#     end

#     def user_serializer_options
#         {:include => {
#             :events => {:except => [:created_at, :updated_at],
#             :include => {
#                 :activities => {
#                     :except => [:created_at, :updated_at],
#                      :include => { :activity_events => {
#                         :except => [:created_at, :updated_at]
#                     }}
#                 }
#             }}
#         },
#     :except =>[:created_at, :updated_at] }
#     end
# end
