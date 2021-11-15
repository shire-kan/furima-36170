require 'rails_helper'

RSpec.describe OrderResidence, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_residence = FactoryBot.build(:order_residence, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_residence).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_residence.building = ''
        expect(@order_residence).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'userが紐付いていないと保存できないこと' do
        @order_residence.user_id = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_residence.item_id = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_residence.postal_code = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_residence.postal_code = '0000000'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureが空だと保存できないこと' do
        @order_residence.prefecture_id = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_residence.municipality = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_residence.address = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_residence.phone_number = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10または11桁の正しい形式でないと保存できないこと' do
        @order_residence.phone_number = '0000000'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include('Phone number is invalid. Need 10 or 11 digits')
      end
      it 'tokenが空だと保存できないこと' do
        @order_residence.token = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
