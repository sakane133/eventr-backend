class Event < ApplicationRecord
    belongs_to :user
    has_many :photos
    has_many :activity_events
    has_many :activities, through: :activity_events, dependent: :destroy
end
