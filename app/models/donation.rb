class Donation < ApplicationRecord

  validates :amount, numericality: true
  validates :name, presence: true
end
