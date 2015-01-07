class BusinessesMailer < ActionMailer::Base
  default from: "larsonkonr@gmail.com"

  def created_email(business)
    @url = 'http://www.larsonkonr.com'
    @business = business
    attachments['blue.png'] = File.read("#{Rails.root}/app/assets/images/blue.png")
    mail(to: 'demo.turing@gmail.com', subject: 'EmployMe')
  end

  def candidacy_email(candidacy)
    @url = 'http://www.larsonkonr.com'
    @candidacy = candidacy
    attachments['blue.png'] = File.read("#{Rails.root}/app/assets/images/blue.png")
    mail(to: @candidacy.listing.business.email, subject: 'EmployMe')
  end
end
