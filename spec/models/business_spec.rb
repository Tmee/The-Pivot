require 'rails_helper'

RSpec.describe Business, :type => :model do

  let(:business) do
    Business.new(name: 'Turing', email: 'zrouth@turing.com', phone: '1231456789',
             address: '1234 blake st')
  end

  it 'is invalid without a name' do
    business.name = nil
    expect(business).not_to be_valid
  end

  it 'is invalid without an email' do
    business.email = nil
    expect(business).not_to be_valid
  end

  it 'is invalid without a unique email' do
    business.save
    invalid_business = business.dup
    invalid_business.email = business.email.upcase
    expect(invalid_business).not_to be_valid
  end

  it 'is invalid without a phone number' do
    business.phone = nil
    expect(business).not_to be_valid
  end

  it 'is invalid without an address' do
    business.address = nil
    expect(business).not_to be_valid
  end

end
