class Tag < ApplicationRecord
  has_many :itemtags, dependent: :destroy
  has_many :items, through: :itemtags

  # validates :name, length: { minimum: 100 }
end
