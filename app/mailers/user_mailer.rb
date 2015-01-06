class UserMailer < ActionMailer::Base
  default from: "larsonkonr@gmail.com"

  def created_email(user)
    @url = 'http://www.larsonkonr.com'
    @user = user
    attachments['blue.png'] = File.read("#{Rails.root}/app/assets/images/blue.png")
    mail(to: @user.email, subject: 'EmployMe')
  end
end
