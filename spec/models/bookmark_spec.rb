require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  let(:bookmark) { FactoryBot.build(:bookmark, user: user, post: post) }

  describe 'いいね機能' do
    context 'いいねができる場合' do
      it 'ログインユーザーによる1投稿に1いいね' do
        expect(bookmark).to be_valid
      end
    end

    context 'いいねができない場合' do
      it '1つの投稿に対して2回以上のいいねはできない' do
        bookmark.save
        another_bookmark = FactoryBot.build(:bookmark, user: user, post: post)
        another_bookmark.valid?
        expect( another_bookmark.errors.full_messages).to include 'Postはすでに存在します'
      end

      it 'ログインしていないユーザーはいいねできない' do
        bookmark.user = nil
        bookmark.valid?
        expect(bookmark.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
