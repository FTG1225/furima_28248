require 'rails_helper'
RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '商品購入機能' do
    context '購入がうまくいく時 ' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      # 郵便番号
      it '郵便番号が必須であること' do
        @purchase.zip_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Zip code can't be blank")
      end
      it '郵便番号にはハイフンが必要であること' do
        @purchase.zip_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end
      # 都道府県
      it '都道府県が必須であること' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      # 市区町村・番地
      it '市区町村が必須であること' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'マンション名が空でも登録できること' do
        @purchase.building_name = nil
        expect(@purchase).to be_valid
      end
      # 電話番号
      it '電話番号が必須であること' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にはハイフンは不要で、11桁以内であること' do
        @purchase.phone_number = '090-1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid.', 'Phone number Phone number is invalid.')
      end
      # _id
      it 'item_idが空では登録できないこと' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
