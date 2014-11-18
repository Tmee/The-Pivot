require 'rails_helper'

RSpec.describe Category, :type => :model do

  let(:category) { Category.new(title: 'sushi') }

  it 'is valid' do
    expect(category).to be_valid
  end
end
