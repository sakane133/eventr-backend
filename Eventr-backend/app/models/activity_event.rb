class ActivityEvent < ApplicationRecord
    belongs_to :event 
    belongs_to :activity 
end
