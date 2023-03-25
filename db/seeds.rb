# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

User.create!(
  [
    {email: 'a@a', name: 'Aさん', password: 'aaaaaa', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user1.png"), filename:"user1.png"), sex: '男性', height: '180'},
    {email: 'b@b', name: 'Bさん', password: 'bbbbbb', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user2.png"), filename:"user2.png"), sex: '女性', height: '160'},
    {email: 'c@c', name: 'Cさん', password: 'cccccc', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user3.png"), filename:"user3.png"), sex: '男性', height: '175'},
    {email: 'd@d', name: 'Dさん', password: 'dddddd', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user4.png"), filename:"user4.png"), sex: '女性', height: '150'},
    {email: 'e@e', name: 'Eさん', password: 'eeeeee', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user1.png"), filename:"user1.png"), sex: '男性', height: '170'}
  ]
)

Tag.create!(
  [
    {name: 'タグ1'},
    {name: 'タグ2'},
    {name: 'タグ3'},
    {name: 'タグ4'},
    {name: 'タグ5'},
    {name: 'タグ6'},
    {name: 'タグ7'},
    {name: 'タグ8'},
    {name: 'タグ9'}
  ]
)

Genre.create!(
  [
    {name: 'クライミングシューズ'},
    {name: 'チョーク'},
    {name: 'チョークバッグ'},
    {name: 'ブラシ'},
    {name: 'クライミングパンツ'}
  ]
)

Maker.create!(
  [
    {name: 'LA SPORTIVA'},
    {name: 'SCARPA'},
    {name: 'TENAYA'},
    {name: 'adidas'},
    {name: 'UNPARALLEL'},
    {name: 'EVOLV'},
    {name: 'pamo'}
  ]
)

Item.create!(
  [
    {name: 'オアシ', genre_id: 1, maker_id: 3, introduction: '初心者にオススメ', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shoes.png"), filename:"shoes.png")},
    {name: 'スクワマ', genre_id: 1, maker_id: 1, introduction: '中級者にから上級者まで', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shoes.png"), filename:"shoes.png")},
    {name: 'トレーニングチョークバッグ', genre_id: 3, maker_id: 1, introduction: '大容量', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/bag.png"), filename:"bag.png")},
    {name: 'hand4r', genre_id: 4, maker_id: 7, introduction: '一本あると便利', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/brush.png"), filename:"brush.png")}
  ]
)

Itemtag.create!(
  [
    {item_id: 1, tag_id: 1},
    {item_id: 1, tag_id: 2},
    {item_id: 1, tag_id: 3},
    {item_id: 1, tag_id: 9},
    {item_id: 2, tag_id: 3},
    {item_id: 2, tag_id: 4},
    {item_id: 2, tag_id: 5},
    {item_id: 3, tag_id: 6},
    {item_id: 3, tag_id: 7},
    {item_id: 4, tag_id: 8}
  ]
)

Review.create!(
  [
    {user_id: 1, item_id: 1, star: 4, comment: 'とてもいいです。'},
    {user_id: 2, item_id: 1, star: 3.5, comment: '足入れがとてもしやすいです。'},
    {user_id: 4, item_id: 1, star: 3, comment: 'トゥがかかりにくい。'},
    {user_id: 3, item_id: 2, star: 5, comment: '最高の一足。'},
    {user_id: 2, item_id: 2, star: 4, comment: 'リピート買いしました。'},
    {user_id: 5, item_id: 2, star: 2, comment: '岩場では柔らかすぎる。'},
    {user_id: 5, item_id: 3, star: 4, comment: 'シンプルで使いやすい。'},
    {user_id: 1, item_id: 3, star: 4, comment: '小物収納も多い。'},
    {user_id: 4, item_id: 3, star: 5, comment: '汚れが落ちやすい。'},
    {user_id: 3, item_id: 4, star: 4, comment: '持ちやすいです。'},
    {user_id: 2, item_id: 4, star: 3, comment: '細かいところは別のブラシが必要。'},
    {user_id: 4, item_id: 4, star: 4, comment: 'ボテを磨くのに最適。'}
  ]
)

Bookmark.create!(
  [
    {user_id: 1, item_id: 1},
    {user_id: 1, item_id: 3},
    {user_id: 2, item_id: 2},
    {user_id: 2, item_id: 4},
    {user_id: 3, item_id: 2},
    {user_id: 3, item_id: 4},
    {user_id: 4, item_id: 1},
    {user_id: 4, item_id: 3},
    {user_id: 4, item_id: 4},
    {user_id: 5, item_id: 2},
    {user_id: 5, item_id: 3},
  ]
)

Relationship.create!(
  [
    {follower_id: 1, following_id: 2},
    {follower_id: 1, following_id: 3},
    {follower_id: 1, following_id: 4},
    {follower_id: 2, following_id: 1},
    {follower_id: 2, following_id: 4},
    {follower_id: 2, following_id: 5},
    {follower_id: 3, following_id: 1},
    {follower_id: 3, following_id: 2},
    {follower_id: 3, following_id: 4},
    {follower_id: 3, following_id: 5},
    {follower_id: 4, following_id: 1},
    {follower_id: 4, following_id: 5},
    {follower_id: 5, following_id: 2},
  ]
)