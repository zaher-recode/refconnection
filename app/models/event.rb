class Event < ApplicationRecord
    belongs_to :organization
    has_many :attendees
    has_many :users, through: :attendees
    has_many :comments


    has_many_attached :images

    searchkick word_start: [ :title, :description, :address]
    
    def search_data
      {
        title: title,
        description: description,
        address: address
      }
    end
end
