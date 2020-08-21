class Contact < ApplicationRecord
  has_one :admin_reply, dependent: :destroy
  validates :message, presence: true,
            length: {minimum: 10}

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

