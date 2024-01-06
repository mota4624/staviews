class Review < ApplicationRecord
  # reviewのアソシエーション
  belongs_to :user
  has_many :comments
  has_many :helpfuls

  # いいね済みかどうか判定
  def helpfuled?(user)
    helpfuls.where(user_id: user.id).exists?
  end

  # ActiveStorage用
  has_many_attached :images
  validate :validate_image_count

  # ActiveHash用のアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  # ActiveHashの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  # reviewのバリデーション
  validates :images, :title, :product_name, :brand, :purchase_date, :user_type, :positive_point, :negative_point, :recommendation,
            presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["brand", "category_id", "created_at", "id", "negative_point", "positive_point", "product_name", "purchase_date", "recommendation", "title", "updated_at", "user_id", "user_type"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "comments", "images_attachments", "images_blobs", "user"]
  end
   

  private

  def validate_image_count
    return unless images.count > 3
    errors.add(:images, 'You can only upload up to 3 images.')
  end
end
