class Contact < ApplicationRecord
  has_one :admin_reply, dependent: :destroy
  validates :message, presence: true,
            length: { minimum: 10 }
end

