class Event < ApplicationRecord
    belongs_to :organization
    has_many :attendees
    has_many :users, through: :attendees

    has_attached :image

end
