require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.images = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
      it '画像が一枚あれば出品できる' do
        @item.images = fixture_file_upload('public/images/test_image.png')
        expect(@item).to be_valid
      end
      it '商品名が４０文字以内だと出品できる' do
        @item.name = 'りんご'
        expect(@item).to be_valid
      end
      it '価格が¥300~¥9,999,999以内であれば出品できる' do
        @item.price = '310'
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      # 画像
      it '画像は1枚必須であること(ActiveStorageを使用すること)' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank")
      end
      # 商品名
      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      # 商品の説明
      it '商品の説明が必須であること' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      # カテゴリー
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      # 商品の状態
      it '商品の状態についての情報が必須であること' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      # 配送料の負担
      it '配送料の負担についての情報が必須であること' do
        @item.shipping_tax_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping tax can't be blank")
      end
      # 発送元の地域
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      # 発送までの日数
      it '発送までの日数についての情報が必須であること' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      # 価格
      it '価格の範囲が、¥300以下では出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格の範囲が、¥9,999,999以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
