class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.timestamps
      t.references :user,    null: false, foreign_key: true
      t.references :post,    null: false, foreign_key: true
      t.string :comment, null: false
    end
  end
end
