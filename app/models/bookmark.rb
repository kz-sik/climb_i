class Bookmark < ApplicationRecord
  #重複しての登録を防ぐ
  validates :user_id, uniqueness: { scope: :item_id }

end
