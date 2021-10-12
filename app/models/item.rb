class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :deliverydays
  belongs_to :shipping
  belongs_to :prefecture

  has_one_attached :image

  validates :title,
            presence: true
  validates :content,
            presence: true
  validates :category_id,
            presence: true,
            numericality: { other_than: 1 }
  validates :condition_id,
            presence: true,
            numericality: { other_than: 1 }
  validates :shipping_id,
            presence: true,
            numericality: { other_than: 1 }
  validates :prefecture_id,
            presence: true,
            numericality: { other_than: 1 }
  validates :deliverydays_id,
            presence: true,
            numericality: { other_than: 1 }
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
