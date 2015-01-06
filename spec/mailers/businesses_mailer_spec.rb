require "rails_helper"

RSpec.describe BusinessesMailer, :type => :mailer do
  it 'sends an email when an user is created' do
    BusinessesMailer.created_email.deliver
    result = ActionMailer::Base.deliveries.last

    expect(result).not_to be_nil
    expect(result.to).to include 'larsonkonr@gmail.com'
    expect(result.from).to include 'larsonkonr@gmail.com'
    expect(result.subject).to eq 'EmployMe'
  end
end
