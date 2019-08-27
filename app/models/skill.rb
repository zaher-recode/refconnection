class Skill < ApplicationRecord
    has_many :userskills, dependent: :destroy
    has_many :users, through: :userskills, dependent: :destroy
end
