require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      # nickname
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      # email
      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '同じemailは登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がなければ保存できないこと' do
        @user.email = 'a123gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      # パスワード
      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが数字のみだと登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'passwordが英字だけだと保存できないこと' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'passwordが全角だと保存できないこと' do
        @user.password = 'いろはに１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'passwordが6文字未満だと保存できないこと' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      # 名字
      it 'sur_nameが空だと保存できないこと' do
        @user.sur_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sur name can't be blank")
      end
      it 'sur_nameが数字だと保存できないこと' do
        @user.sur_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sur name is invalid')
      end
      it 'sur_nameが英字だと保存できないこと' do
        @user.sur_name = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sur name is invalid')
      end
      it 'sur_nameが全角でないと登録できない' do
        @user.sur_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sur name is invalid')
      end
      # 名前
      it 'given_nameが空だと保存できないこと' do
        @user.given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end
      it 'given_nameが数字だと保存できないこと' do
        @user.given_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name is invalid')
      end
      it 'given_nameが英字だと保存できないこと' do
        @user.given_name = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name is invalid')
      end
      it 'given_nameが全角でないと登録できない' do
        @user.given_name = 'ｲﾁﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name is invalid')
      end
      # 名字(カナ)
      it 'sur_name_kanaが空だと登録できない' do
        @user.sur_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sur name kana can't be blank")
      end
      it 'sur_name_kanaがカタカナでないと登録できない' do
        @user.sur_name_kana = 'ｲﾁﾛｳichi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sur name kana is invalid')
      end
      # 名前(カナ)
      it 'given_name_kanaが空だと登録できない' do
        @user.given_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana can't be blank")
      end
      it 'given_name_kanaがカタカナでないと登録できない' do
        @user.given_name_kana = 'ﾔﾏﾀﾞyama'
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name kana is invalid')
      end
      # 生年月日
      it 'date_of_birthが空だと登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
