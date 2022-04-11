require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it 'すべての値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it 'productが空だと登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'discriptionが空では登録できない' do
        @item.discription = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Discription can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idに1が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idに1が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'cost_idが空では登録できない' do
        @item.cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'cost_idに1が選択されている場合は出品できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idに1が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'sending_idが空では登録できない' do
        @item.sending_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending can't be blank")
      end
      it 'sending_idに1が選択されている場合は出品できない' do
        @item.sending_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが1000000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが半角英字のみでは出品できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters',
                                                      'Price is out of setting range')
      end
      it 'priceが半角英数字混合では出品できない' do
        @item.price = 'aa11'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters',
                                                      'Price is out of setting range')
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters',
                                                      'Price is out of setting range')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
