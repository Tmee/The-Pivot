class Business < ActiveRecord::Base
  has_many :users

  validates :description, presence: true
  validates :name, presence: true
  validates :loction, presence: true

end
