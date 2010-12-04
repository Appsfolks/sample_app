include SessionsHelper
class Notifier < ActionMailer::Base
  default :from => "Kaargo <mailer@kaargo.com>"  

    def registration_confirmation(user)  
      @url = "http://www.kaargo.com/signin"
      @user = user
      mail(:to => user.email, :bcc=> "sathishkumar.r@gmail.com" , :subject => "Registered")  
    end
    
    def follow_confirmation(followed, currentuser)
      @follower = currentuser
      @followed = followed
      @url = "http://www.kaargo.com/signin"
      mail(:to => followed.email, :bcc=> "sathishkumar.r@gmail.com", :subject => "#{currentuser.name} is following you" )
    end

end
