class Activity < ApplicationRecord
    has_many :activity_events, dependent: :destroy
    has_many :events, through: :activity_events
end
