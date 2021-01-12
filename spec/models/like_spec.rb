require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  let(:like) { FactoryBot.create(:like, user_id: user.id, post_id: post.id) }

  describe 'いいね機能' do
    context 'いいねができる場合' do
      it 'ログインユーザーによる1投稿に1いいね' do
        expect(like).to be_valid
      end
    end

    context 'いいねができない場合' do
      it '1つの投稿に対して2回以上のいいねはできない' do
        like.save
        another_like = FactoryBot.build(:like, user_id: user.id, post_id: post.id)
        another_like.valid?
        expect( another_like.errors.full_messages).to include 'Postはすでに存在します'
      end

      it 'ログインしていないユーザーはいいねできない' do
        like.user = nil
        like.valid?
        expect(like.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
