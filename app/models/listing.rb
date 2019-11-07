class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :system
  belongs_to :year
  belongs_to :condition
  belongs_to :machine

  enum is_donated: { pending: 0, published: 1 }

  has_one_attached :picture

  max_paginates_per 6

  validates :description, presence: true,
            length: { minimum: 10 }

  validates :title, presence: true,
            length: { minimum: 5 }          

end

