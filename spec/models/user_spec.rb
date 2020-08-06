require 'rails_helper'

describe User do
  describe '#create' do
    it '全ての値が正しく入力されていれば保存できること' do
      user = build(:user)
      expect(user).to be_valid
    end

    # nickname
    it 'nicknameが空だと保存できないこと' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # email
    it 'emailが空だと保存できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it '同じemailは登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end
    it 'emailに@がなければ保存できないこと' do
      user = build(:user, email: 'aaaa.com')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end

    # パスワード
    it 'passwordが空だと保存できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it 'passwordが数字だけだと保存できないこと' do
      user = build(:user, password: '111111')
      user.valid?
      expect(user.errors[:password]).to include('is invalid')
    end
    it 'passwordが英字だげだと保存できないこと' do
      user = build(:user, password: 'testtest')
      user.valid?

      expect(user.errors[:password]).to include('is invalid')
    end
    it 'passwordが全角だと保存できないこと' do
      user = build(:user, password: 'あいう１２b')
      user.valid?
      expect(user.errors[:password]).to include('is invalid')
    end
    it 'passwordが6文字未満だと保存できないこと' do
      user = build(:user, password: 'ab123')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 名字
    it 'sur_nameが空だと保存できないこと' do
      user = build(:user, sur_name: nil)
      user.valid?
      expect(user.errors[:sur_name]).to include("can't be blank")
    end
    it 'sur_nameが数字だと保存できないこと' do
      user = build(:user, sur_name: '123')
      user.valid?
      expect(user.errors[:sur_name]).to include('is invalid')
    end
    it 'sur_nameが英字だと保存できないこと' do
      user = build(:user, sur_name: 'yamada')
      user.valid?
      expect(user.errors[:sur_name]).to include('is invalid')
    end
    it 'sur_nameが半角だと保存できないこと' do
      user = build(:user, sur_name: 'ﾔﾏﾀﾞyamada123')
      user.valid?
      expect(user.errors[:sur_name]).to include('is invalid')
    end

    # 名前
    it 'given_nameが空だと保存できないこと' do
      user = build(:user, given_name: nil)
      user.valid?
      expect(user.errors[:given_name]).to include("can't be blank")
    end
    it 'given_nameが数字だと保存できないこと' do
      user = build(:user, given_name: '123')
      user.valid?
      expect(user.errors[:given_name]).to include('is invalid')
    end
    it 'given_nameが英字だと保存できないこと' do
      user = build(:user, given_name: 'ichiro')
      user.valid?
      expect(user.errors[:given_name]).to include('is invalid')
    end
    it 'given_nameが半角だと保存できないこと' do
      user = build(:user, given_name: 'ｲﾁﾛｳichiro123')
      user.valid?
      expect(user.errors[:given_name]).to include('is invalid')
    end

    # 名字(カナ)
    it 'sur_name_kanaが空だと保存できないこと' do
      user = build(:user, sur_name_kana: nil)
      user.valid?
      expect(user.errors[:sur_name_kana]).to include("can't be blank")
    end
    it 'sur_name_kanaが漢字だと保存できないこと' do
      user = build(:user, sur_name_kana: '山田')
      user.valid?
      expect(user.errors[:sur_name_kana]).to include('is invalid')
    end
    it 'sur_name_kanaが数字だと保存できないこと' do
      user = build(:user, sur_name_kana: '123')
      user.valid?
      expect(user.errors[:sur_name_kana]).to include('is invalid')
    end
    it 'sur_name_kanaが英字だと保存できないこと' do
      user = build(:user, sur_name_kana: 'yamada')
      user.valid?
      expect(user.errors[:sur_name_kana]).to include('is invalid')
    end
    it 'sur_name_kanaがひらがなだと保存できないこと' do
      user = build(:user, sur_name_kana: 'やまだ')
      user.valid?
      expect(user.errors[:sur_name_kana]).to include('is invalid')
    end
    it 'sur_name_kanaが半角だと保存できないこと' do
      user = build(:user, sur_name_kana: 'ﾔﾏﾀﾞ')
      user.valid?
      expect(user.errors[:sur_name_kana]).to include('is invalid')
    end

    # 名前(カナ)
    it 'given_name_kanaが空だと保存できないこと' do
      user = build(:user, given_name_kana: nil)
      user.valid?
      expect(user.errors[:given_name_kana]).to include("can't be blank")
    end
    it 'given_name_kanaが漢字だと保存できないこと' do
      user = build(:user, given_name_kana: '一郎')
      user.valid?
      expect(user.errors[:given_name_kana]).to include('is invalid')
    end
    it 'given_name_kanaが数字だと保存できないこと' do
      user = build(:user, given_name_kana: '123')
      user.valid?
      expect(user.errors[:given_name_kana]).to include('is invalid')
    end
    it 'given_name_kanaが英字だと保存できないこと' do
      user = build(:user, given_name_kana: 'ichiro')
      user.valid?
      expect(user.errors[:given_name_kana]).to include('is invalid')
    end
    it 'given_name_kanaがひらがなだと保存できないこと' do
      user = build(:user, given_name_kana: 'いちろう')
      user.valid?
      expect(user.errors[:given_name_kana]).to include('is invalid')
    end
    it 'given_name_kanaが半角だと保存できないこと' do
      user = build(:user, given_name_kana: 'ｲﾁﾛｳ')
      user.valid?
      expect(user.errors[:given_name_kana]).to include('is invalid')
    end

    # 生年月日
    it 'date_of_birthに空の値があると保存できないこと' do
      user = build(:user, date_of_birth: '1900-nil-1')
      user.valid?
      expect(user.errors[:date_of_birth]).to include("can't be blank")
    end
  end
end