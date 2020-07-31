class Contact < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one :admin_reply, dependent: :destroy
  validates :message, presence: true,
            length: { minimum: 10 }
end

