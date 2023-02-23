class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :star, presence: true
  validates :comment, presence: true
end
