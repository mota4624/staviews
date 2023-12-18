class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string      :title,           null: false
      t.integer     :category_id,        null: false
      t.string      :product_name,    null: false
      t.string      :brand,           null: false
      t.date        :purchase_date,   null: false
      t.string      :user_type,       null: false
      t.text        :positive_point,  null: false
      t.text        :negative_point,  null: false
      t.text        :recommendation,  null: false
      t.references  :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
