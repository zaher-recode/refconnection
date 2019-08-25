class Message < ApplicationRecord

  after_create :create_notifications

  belongs_to :user
  belongs_to :conversation
  has_many :users, through: :conversation

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  private

    def recipient
        self.conversation.opposed_user(actor)        
    end

    def actor
      self.user        
    end


    def create_notifications
        # recipients.each do |recipient|
        # Notification.create(recipient: recipient, maker: self.user,
        #     action: 'commented', notifiable: self)
        # end
          Notification.create(recipient: recipient, actor: actor, action: 'messaged', notifiable: self)
        
    end

end
