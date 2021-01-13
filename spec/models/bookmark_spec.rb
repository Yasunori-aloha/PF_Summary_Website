require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { FactoryBot.build(:bookmark) }

  describe 'ブックマーク機能' do
    context 'ブックマークができる場合' do
      it 'ログインユーザーによる1投稿に1回しかできない' do
        expect(bookmark).to be_valid
      end
    end

    context 'ブックマークができない場合' do
      it '1つの投稿に対して2回以上はできない' do
        bookmark.save
        another_bookmark = FactoryBot.build(:bookmark, user_id: bookmark.user_id, post_id: bookmark.post_id )
        another_bookmark.valid?
        expect( another_bookmark.errors.full_messages).to include 'Postはすでに存在します'
      end

      it 'ログインしていないユーザーはブックマークできない' do
        bookmark.user = nil
        bookmark.valid?
        expect(bookmark.errors.full_messages).to include 'Userを入力してください'
      end

      it '存在しない投稿に対してのブックマーク' do
        bookmark.post = nil
        bookmark.valid?
        expect(bookmark.errors.full_messages).to include 'Postを入力してください'
      end
    end
  end
end
