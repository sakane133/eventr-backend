class Activity < ApplicationRecord
    has_many :activity_events
    has_many :events, through: :activity_events
end
