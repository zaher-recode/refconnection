class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :attendees
  has_many :events, :through => :attendees
  has_many :messages, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id
  has_many :notifications, foreign_key: :recipient_id
  has_one_attached :image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
