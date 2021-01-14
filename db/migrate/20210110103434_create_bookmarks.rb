class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|

      t.timestamps
      t.references :user,        null: false, foreign_key: true
      t.references :post,        null: false, foreign_key: true
    end
  end
end
