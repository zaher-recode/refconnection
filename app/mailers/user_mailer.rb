class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        @url  = "refconnection.site/users/sign_in"
        mail(to: @user.email, subject: 'Welcome to RefConnection')
    end
end
