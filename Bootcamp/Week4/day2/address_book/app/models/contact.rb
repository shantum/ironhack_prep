class Contact < ApplicationRecord
  validates :Name, :Email, :Phone, :Address, presence: true
end
