class Business < ActiveRecord::Base
  has_many :users

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
