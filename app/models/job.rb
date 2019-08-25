class Job < ApplicationRecord
    has_many_attached :images
    belongs_to :organization

    searchkick word_start: [ :title, :description, :position, :address]
    
    def search_data
      {
        title: title,
        description: description,
        position: position,
        address: address
      }
    end
    
end
