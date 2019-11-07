class Year < ApplicationRecord
  has_many :listings

  validates :name, presence: true
  validates :name, numericality: true

end
