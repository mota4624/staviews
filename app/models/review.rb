class Review < ApplicationRecord
  # reviewのアソシエーション
  belongs_to :user
  has_many :comments

  # ActiveStorage用
  has_many_attached :images
  validate :validate_image_count

  # ActiveHash用のアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  # ActiveHashの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  # reviewのバリデーション
  validates :title, :product_name, :brand, :purchase_date, :user_type, :positive_point, :negative_point, :recommendation,
            presence: true

  private

  def validate_image_count
    return unless images.count > 3

    errors.add(:images, 'You can only upload up to 3 images.')
  end
end
