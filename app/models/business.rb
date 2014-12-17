class Business < ActiveRecord::Base
  has_many :users
  has_many :listings

  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :slug, presence: true
  validates :url, presence: true
  validates :description, presence: true
end
