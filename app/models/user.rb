class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :attendees
  has_many :events, :through => :attendees
<<<<<<< HEAD
<<<<<<< HEAD
  has_many :skills
  has_many :experiences
  has_many :industries, :through => :experiences

=======
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  
>>>>>>> c537e021eca1cb2190892139269ee56fd6ea9ab5
=======
  has_many :messages, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id
  has_many :notifications, foreign_key: :recipient_id
>>>>>>> be561857f4aaf9b07ae7d26eec917a89248d4a72
  has_one_attached :image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
