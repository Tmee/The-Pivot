class Listing < ActiveRecord::Base
  belongs_to :business

  validates :title, presence: true
end
