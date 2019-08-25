class Review < ApplicationRecord
    after_create :create_notifications

    belongs_to :user
    belongs_to :post
    has_many :users, through: :post

    private

    def recipient
        self.post.user        
    end  

    def actor
        self.user        
    end


    def create_notifications
        # recipients.each do |recipient|
        # Notification.create(recipient: recipient, maker: self.user,
        #     action: 'commented', notifiable: self)
        # end
        if recipient != actor
            Notification.create(recipient: recipient, actor: actor, action: 'reviewed', notifiable: self)
        end  
    end
end
