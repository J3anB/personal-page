class Contact < ApplicationRecord
  validates :message, presence: true,
            length: { minimum: 10 }
end

