require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:another_user) { FactoryBot.build(:user) }

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない場合' do
      it 'nicknameが空だと登録できない' do
        user.nickname = ''
        user.valid?
        expect(user.errors.full_messages).to include 'ユーザー名を入力してください'
      end

      it 'emailが空だと登録できない' do
        user.email = ''
        user.valid?
        expect(user.errors.full_messages).to include 'メールを入力してください'
      end

      it '重複したemailが存在する場合登録することができない' do
        user.save
        another_user.email = user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'メールはすでに存在します'
      end

      it 'emailに@が入っていないと登録できない' do
        user.email = 'test.test'
        user.valid?
        expect(user.errors.full_messages).to include 'メールは不正な値です'
      end

      it 'passwordが空だと登録できない' do
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードを入力してください'
      end

      it 'passwordが7文字以下だと登録できない' do
        user.password = '111111a'
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        user.password_confirmation = ''
        user.valid?
        expect(user.errors.full_messages).to include '確認用パスワードを入力してください'
      end

      it 'password_confirmationとpasswordの内容が一致しないと登録できない' do
        user.password_confirmation = '1234567b'
        user.valid?
        expect(user.errors.full_messages).to include '確認用パスワードとパスワードの入力が一致しません'
      end

      it 'passwordは半角英字のみの場合登録できない' do
        user.password = 'aaaaaaaa'
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'passwordは半角数字のみの場合登録できない' do
        user.password = '11111111'
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'passwordは全角英数字の場合登録できない' do
        user.password = '１１１ａａａ１１'
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードは不正な値です'
      end
    end
  end
end
