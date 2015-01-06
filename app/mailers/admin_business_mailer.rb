class AdminBusinessMailer < ActionMailer::Base
  default from: "larsonkonr@gmail.com"

  def update_status_email(business)
    @url = 'http://www.larsonkonr.com'
    @business = business
    attachments['blue.png'] = File.read("#{Rails.root}/app/assets/images/blue.png")
    mail(to: @business.email, subject: 'EmployMe')
  end
end
