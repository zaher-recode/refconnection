class User < ApplicationRecord
  has_many :posts
  has_many :reviews
  has_many :comments
  has_many :attendees
  has_many :events, :through => :attendees

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
