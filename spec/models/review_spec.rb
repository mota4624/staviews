require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  def add_images_to_review(count)
    count.times do
      @review.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

  describe '投稿情報の保存' do
    context '投稿情報の保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@review).to be_valid
      end
    end

    context '投稿情報の保存ができない場合' do
      it 'titleがなければ保存できない' do
        @review.title = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Title can't be blank")
      end

      it 'category_idが1なら保存できない' do
        @review.category_id = '1'
        @review.valid?
        expect(@review.errors.full_messages).to include("Category can't be blank")
      end

      it 'product_nameがなければ保存できない' do
        @review.product_name = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Product name can't be blank")
      end

      it 'brandがなければ保存できない' do
        @review.brand = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Brand can't be blank")
      end

      it 'purchase_dateがなければ保存できない' do
        @review.purchase_date = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Purchase date can't be blank")
      end

      it 'user_typeがなければ保存できない' do
        @review.user_type = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("User type can't be blank")
      end

      it 'positive_pointがなければ保存できない' do
        @review.positive_point = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Positive point can't be blank")
      end

      it 'negative_pointがなければ保存できない' do
        @review.negative_point = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Negative point can't be blank")
      end

      it 'recommendationがなければ保存できない' do
        @review.recommendation = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Recommendation can't be blank")
      end

      it 'userが紐付いていなければ出品できない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('User must exist')
      end

      it 'imagesがなければ保存できない' do
        @review.images.purge
        @review.valid?
        expect(@review.errors.full_messages).to include("Images can't be blank")
      end

      it 'imagesが3枚以上の場合は保存できない' do
        add_images_to_review(4)
        @review.valid?
        expect(@review.errors.full_messages).to include('Images You can only upload up to 3 images.')
      end
    end
  end
end
