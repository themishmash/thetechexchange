class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :system
  belongs_to :year
  belongs_to :condition
  belongs_to :location

  enum is_donated: { all: 0, donated: 1, active: 2 }
end
