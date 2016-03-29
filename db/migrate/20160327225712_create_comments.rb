class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true, foreign_key: true
      t.integer :user_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
