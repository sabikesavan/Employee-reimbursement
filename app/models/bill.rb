class Bill < ApplicationRecord
  belongs_to :employee
  enum status: { pending: 0, approved: 1, rejected: 2 }

  before_create :set_default_status

  def set_default_status
    self.status ||= 'pending'
  end

end
