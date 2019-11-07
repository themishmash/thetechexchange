class Condition < ApplicationRecord
  has_many :listings


  validates :condition, presence: true
  

end
