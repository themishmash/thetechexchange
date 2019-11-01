class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :system
  belongs_to :year
  belongs_to :condition
  belongs_to :machine

  enum is_donated: { pending: 0, published: 1 }

  has_one_attached :picture

end

