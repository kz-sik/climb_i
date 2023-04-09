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

  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :reviews, allow_destroy: true

  before_validation :validate_tag
  after_save :create_tag

  attribute :tag_names, :string, default: ""

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

  def self.partial_match(word)
    where("name LIKE?","%#{word}%")
  end

  private

  def validate_tag
    tag_names = self.tag_names.split(",")
    tag_names.each do |tag_name|
      tag = Tag.new(name: tag_name)
      if tag.invalid?
        self.errors.add(:tag_name, "タグが不正です")
        break
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
      new_post_tag = Tag.find_or_create_by(name: new_tag)
      self.tags << new_post_tag
    end
  end
end
