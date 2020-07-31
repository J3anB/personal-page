class Contact < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :message, presence: true,
            length: { minimum: 10 }
end

