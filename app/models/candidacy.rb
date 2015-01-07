class Candidacy < ActiveRecord::Base
  belongs_to :listings
  belongs_to :users
  belongs_to :businesses

end
