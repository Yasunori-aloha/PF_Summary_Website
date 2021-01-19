require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.build(:post) }

  describe '投稿機能' do
    context '投稿ができるとき' do
      it '全ての項目の入力が存在すれば投稿できる' do
        expect(post).to be_valid
      end
    end

    context '投稿ができないとき' do
      it 'nameが空だと投稿できない' do
        post.name = ''
        post.valid?
        expect(post.errors.full_messages).to include 'タイトルを入力してください'
      end

      it 'contentが空だと投稿できない' do
        post.content = ''
        post.valid?
        expect(post.errors.full_messages).to include '内容を入力してください'
      end

      it 'contentが501文字以上だと投稿できない' do
        post.content = 'ア' * 501
        post.valid?
        expect(post.errors.full_messages).to include '内容は500文字以内で入力してください'
      end

      it 'URLが空だと投稿できない' do
        post.url = ''
        post.valid?
        expect(post.errors.full_messages).to include 'URLを入力してください'
      end

      it 'URLの始めにHTTPが書かれていなければ投稿できない' do
        post.url = 'fay-rutherford.com/digna_littel'
        post.valid?
        expect(post.errors.full_messages).to include 'URLは不正な値です'
      end

      it '未ログインユーザーは投稿できない' do
        post.user = nil
        post.valid?
        expect(post.errors.full_messages).to include 'ユーザーを入力してください'
      end
    end
  end
end
