class OrderResidence
  include ActiveModel::Model
  attr_accessor :user_id,
                :item_id,
                :postal_code,
                :prefecture_id,
                :municipality,
                :address,
                :building,
                :phone_number,
                :order_id,
                :token,
                :authenticity_token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'is invalid. Need 10 or 11 digits' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code,
                     prefecture_id: prefecture_id,
                     municipality: municipality,
                     address: address,
                     building: building,
                     phone_number: phone_number,
                     order_id: order.id)
  end
end
