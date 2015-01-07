class Candidacy < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  before_create :set_initial_status

  scope :pending, -> { where(status: 'pending') }

  def set_initial_status
    self.status = "pending"
  end

  def reject
    update_attribute :status, "rejected"
  end

  def accept
    update_attribute :status, "accepted"
  end

  def email
    listing.email
  end

end
