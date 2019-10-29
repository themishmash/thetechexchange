class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :system
  belongs_to :year
  belongs_to :condition
  belongs_to :machine

  enum is_donated: { complete: 0, donated: 1, active: 2 }

  has_one_attached :picture

end
