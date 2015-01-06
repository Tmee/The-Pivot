class Candidacy < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
  belongs_to :business

end
