class Item < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true

  has_many :itemtags, dependent: :destroy
  has_many :tags, through: :itemtags # tag_ids
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :maker
  belongs_to :genre

  #親モデルを保存するときに、Associationで関連づけた子モデルも一緒に保存する
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :reviews, allow_destroy: true

  #validation前に実行するメソッドの指定
  before_validation :validate_tag
  #save後に実行するメソッドの指定
  after_save :create_tag

  #型を持つ属性をこのモデルに定義
  attribute :tag_names, :string, default: ""

  #画像が存在していない場合の表示画像の指定と画像のサイズ変更
  def get_item_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_item_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  #既にブックマークしているかの検証
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  
  #部分検索メソッド
  def self.partial_match(word)
    where("name LIKE?","%#{word}%")
  end

  private

  def validate_tag
    tag_names = self.tag_names.split(",") # tag_namesを分割し配列にする
    tag_names.each do |tag_name|
      tag = Tag.new(name: tag_name)
      if tag.invalid? # エラーがある場合true
        self.errors.add(:tag_name, "タグが不正です") # エラーメッセージの追加
        break # エラーがあった時点でeachを抜ける為
      end
    end
  end

  def create_tag
    return if self.tag_names.blank?
    current_tags = if self.tags.present?
      self.tags.pluck(:name)
    else
      []
    end

    new_tags = self.tag_names.split(",") - current_tags
    new_tags.each do |new_tag|
      new_post_tag = Tag.find_or_create_by(name: new_tag) # new_tagが存在しなければ新規作成し保存
      self.tags << new_post_tag # self.tagsにnew_post_tagを追加する
    end
  end
end
