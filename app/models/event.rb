class Event < ApplicationRecord
    belongs_to :organization
    has_many :attendees
    has_many :users, through: :attendees
    has_many :comments


    has_many_attached :images

end
