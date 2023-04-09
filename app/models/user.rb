class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :following
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(following_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(following_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  def get_profile_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def self.partial_match(word)
    where("name LIKE?","%#{word}%")
  end
end
