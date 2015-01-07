class Listing < ActiveRecord::Base
  belongs_to :business
  has_many :candidacies

  validates :title, presence: true
  validates :description, presence: true
  validates :wage, presence: true
  validates :hours, presence: true
  validates :number_of_positions, presence: true
  validates :end_date, presence: true
end
