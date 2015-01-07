class Listing < ActiveRecord::Base
  belongs_to :business
  has_many :candidacies

  validates :title, presence: true
end
