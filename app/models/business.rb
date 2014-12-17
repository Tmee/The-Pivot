class Business < ActiveRecord::Base
  has_many :users

  validates :name, presence: true
  # validates :address, presence: true
  # validates :phone, presence: true
  # validates :email, presence: true
  # validates :slug, presence: true
  # validates :url, presence: true
  # validates :description, presence: true

  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
