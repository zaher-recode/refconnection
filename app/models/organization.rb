class Organization < ApplicationRecord
  has_many :jobs 
  has_many :events 

  has_one_attached :image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  searchkick word_start: [ :company_name, :address]

  def search_data
    {
      company_name: company_name,
      address: address
    }
  end
end
