require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { FactoryBot.create(:tag) }

  describe 'タグ付機能' do
    context '機能がうまくいくとき' do
      it 'tag_nameが入力されていればタグ付できる' do
        expect(tag).to be_valid
      end
    end

    context '機能がうまくいかないとき' do
      it 'tag_nameが空だとタグ付できない' do
        tag.tag_name = ""
        tag.valid?
        expect(tag.errors.full_messages).to include 'Tag nameを入力してください'
      end
    end
  end
end
