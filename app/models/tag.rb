class Tag < ApplicationRecord
  has_many :itemtags, dependent: :destroy
  has_many :items, through: :itemtags
  
  def self.looks(word)
    @tag = Ta.where("name LIKE?","%#{word}%")
  end
end
