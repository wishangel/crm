class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :customer, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
