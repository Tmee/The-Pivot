class Business < ActiveRecord::Base
  has_many :users
  has_many :listings

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  # validates_format_of :email, { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/, message: "must be a valid email address"}
  validates :address, presence: true
  validates :phone, presence: true
  # validates :slug, presence: true
  # validates :url, presence: true
  # validates :description, presence: true

  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
