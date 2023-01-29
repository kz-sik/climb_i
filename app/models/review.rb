class Review < ApplicationRecord
  belongs_to :item, dependent: :destroy
  belongs_to :user
end
