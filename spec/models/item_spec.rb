require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテム出品' do
    context '出品できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'titleが40字を超えると出品できない' do
        @item.title = 'あああああああああああああああああああああああああああああああああああああああああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Title is too long (maximum is 40 characters)')
      end
      it 'contentが空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'contentが1000字を超えると出品できない' do
        @item.content = 'あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Content is too long (maximum is 1000 characters)')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999を超えると出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字以外では出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be greater than 1')
      end
      it 'category_idが11を超えると出品できない' do
        @item.category_id = 12
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be less than or equal to 11')
      end
      it 'condition_idが空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが1では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be greater than 1')
      end
      it 'condition_idが7を超えると出品できない' do
        @item.condition_id = 8
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be less than or equal to 7')
      end
      it 'shipping_idが空では出品できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'shipping_idが1では出品できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping must be greater than 1')
      end
      it 'shipping_idが3を超えると出品できない' do
        @item.shipping_id = 4
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping must be less than or equal to 3')
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be greater than 1')
      end
      it 'prefecture_idが49を超えると出品できない' do
        @item.prefecture_id = 50
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be less than or equal to 49')
      end
      it 'deliverydays_idが空では出品できない' do
        @item.deliverydays_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverydays can't be blank")
      end
      it 'deliverydays_idが1では出品できない' do
        @item.deliverydays_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliverydays must be greater than 1')
      end
      it 'deliverydays_idが4を超えると出品できない' do
        @item.deliverydays_id = 5
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliverydays must be less than or equal to 4')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
