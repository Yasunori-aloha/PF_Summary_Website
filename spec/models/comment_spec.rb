require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.build(:comment) }

  describe 'コメント機能' do
    context 'コメントができるとき' do
      it 'コメントの入力が存在すればコメントできる' do
        expect(comment).to be_valid
      end

      it '文字数が140文字以内ならコメントできる' do
        comment.comment = 'ア' * 140
        expect(comment).to be_valid
      end
    end

    context 'コメントできないとき' do
      it 'コメントが空ではコメントできない' do
        comment.comment = ''
        comment.valid?
        expect(comment.errors.full_messages).to include 'コメントを入力してください'
      end

      it 'コメントが141文字以上だとコメントできない' do
        comment.comment = 'ア' * 141
        comment.valid?
        expect(comment.errors.full_messages).to include 'コメントは140文字以内で入力してください'
      end

      it '未ログインユーザーはコメントできない' do
        comment.user = nil
        comment.valid?
        expect(comment.errors.full_messages).to include 'ユーザーを入力してください'
      end
    end
  end
end
