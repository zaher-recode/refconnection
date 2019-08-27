class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :events, :through => :attendees

  has_many :skills
  has_many :experiences
  has_many :industries, :through => :experiences

  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  has_many :messages, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id
  has_many :notifications, foreign_key: :recipient_id
  
  has_one_attached :image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]


    searchkick word_start: [ :username]
    
    def search_data
      {
        username: username
      }
    end


    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.provider = auth.provider
        user.uid = auth.uid
        user.password = Devise.friendly_token[0,20]
      end
    end
    
end
