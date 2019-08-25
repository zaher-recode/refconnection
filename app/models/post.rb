class Post < ApplicationRecord
    has_many_attached :images
    belongs_to :user
    belongs_to :category
    has_many :reviews
    has_many :comments, dependent: :destroy

    def show_rating
        unless self.rates_num == 0
        (self.rates_total / self.rates_num.to_f).round(1) 
        else
          "No Ratings yet!"
        end
      end
    
      def add_rating(new_rating)
        self.rates_num +=1
        self.rates_total += new_rating.to_i
        self.save
      end
end
