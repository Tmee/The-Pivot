require 'rails_helper'

RSpec.describe Listing, :type => :model do

  let(:listing) do
    Listing.new(title: 'email@gmail.com', description: 'zach man', wage: '10',
             hours: 'password', number_of_positions: 'password', end_date: 'asdf')
  end

  it 'is not valid without a title' do
    listing.title = nil
    expect(listing).not_to be_valid
  end

  it 'is not valid without a description' do
    listing.description = nil
    expect(listing).not_to be_valid
  end

  it 'is not valid without a wage' do
    listing.wage = nil
    expect(listing).not_to be_valid
  end

  it 'is not valid without hours' do
    listing.hours = nil
    expect(listing).not_to be_valid
  end

  it 'is not valid without number of positions' do
    listing.number_of_positions = nil
    expect(listing).not_to be_valid
  end

  it 'is not valid without an end date' do
    listing.end_date = nil
    expect(listing).not_to be_valid
  end

end
