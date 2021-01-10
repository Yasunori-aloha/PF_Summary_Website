class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|

      t.timestamps
      t.string :tag_name,        null: false
      t.references :post,        null: false, foreign_key: true
    end
  end
end
