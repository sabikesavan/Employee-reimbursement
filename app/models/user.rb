class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true

  enum role: { admin: 0, employee: 1 }

  def is_admin?
    role == 'admin'
  end

  def is_employee?
    role == 'employee'
  end
end
