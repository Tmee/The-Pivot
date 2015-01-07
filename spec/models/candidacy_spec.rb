require 'rails_helper'

RSpec.describe Candidacy, :type => :model do

  let(:candidacy) do
    Candidacy.new(status: 'pending', letter_to_business: '')
  end

  it 'is valid without a status' do
    candidacy.save
    candidacy.status = nil
    expect(candidacy).to be_valid
  end

  it 'is valid without a letter to business' do
    candidacy.status = nil
    expect(candidacy).to be_valid
  end

end
