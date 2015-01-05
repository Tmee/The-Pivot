class User < ActiveRecord::Base
  belongs_to :business
  has_secure_password
  has_attached_file :picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
  },
  :path => "/employmetoday/avatars/:style/:id/:filename",
  # http://stackoverflow.com/questions/6450207/how-to-use-seed-data-with-paperclip-s3
  :default_url => "https://s3-us-west-2.amazonaws.com/employmetoday/users/pictures/000/000/118/original/chandra.jpg"
  has_attached_file :resume

  validates :password, confirmation: true
  validates :full_name, presence: true
  validates :user_name, allow_blank: true,
                        length: { in: 2..32 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  validates :picture,
  attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
  attachment_size: { less_than: 1.megabytes }

  validates_attachment :resume,
  :content_type => { :content_type => %w(application/pdf) }

  def is_admin?
    admin
  end

  def json_cart
    cart.empty? ? "{}" : cart
  end

  def parsed_cart
    JSON.parse(json_cart)
  end

end
