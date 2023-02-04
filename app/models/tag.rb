class Tag < ApplicationRecord
  has_many :itemtags, dependent: :destroy
  has_many :items, through: :itemtags

end
