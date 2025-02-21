class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_secure_password
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
end
