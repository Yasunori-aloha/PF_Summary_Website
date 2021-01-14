class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.timestamps
      t.string :name,          null: false
      t.text :content,         null: false
      t.string :url,           null: false
      t.references :user,      null: false, foreign_key: true
    end
  end
end
