class Genre < ApplicationRecord
  has_many :genres

  validates :name, presence: true
end
