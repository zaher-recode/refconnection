class Post < ApplicationRecord
    has_many_attached :images
    belongs_to :user
    belongs_to :category
    has_many :reviews
    has_many :comments

end
