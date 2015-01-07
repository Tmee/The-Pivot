require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  it 'sends an email when an user is created' do
    UserMailer.created_email(@user).deliver
    result = ActionMailer::Base.deliveries.last

    expect(result).not_to be_nil
    expect(result.to).to include @user.email
    expect(result.from).to include 'larsonkonr@gmail.com'
    expect(result.subject).to eq 'EmployMe'
  end
end
