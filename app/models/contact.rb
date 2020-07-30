class Contact < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :admin_replies, dependent: :destroy
  validates :message, presence: true,
            length: { minimum: 10 }
end

