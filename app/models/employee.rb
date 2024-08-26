class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :user, optional: true

  validates :email, uniqueness: true

  after_create :create_user

  def create_user
    User.create(name: "#{first_name} #{last_name}", email: email, password: email, role: 'employee')
  end
end
