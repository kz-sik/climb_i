class Item < ApplicationRecord
  has_one_attached :image

  has_many :itemtags, dependent: :destroy
  has_many :tags, through: :itemtags
end
