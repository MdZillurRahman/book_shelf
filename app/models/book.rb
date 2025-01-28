class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  enum status: { will_read: 0, reading: 1, read: 2 }

  validates :title, :author, :genre, :status, presence: true
end
