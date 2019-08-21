class Job < ApplicationRecord
    has_many_attached :images
    belongs_to :organization
end
