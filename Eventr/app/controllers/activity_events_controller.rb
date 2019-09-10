class ActivityEventsController < ApplicationController


def update
    activity_event = ActivityEvent.find(params[:id])
    activity_event.update(selected: params[:selected])
    render json: activity_event
end




end