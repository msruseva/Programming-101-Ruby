class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :brand, foreign_key: true, index: true
      t.belongs_to :category, foreign_key: true, index: true
      t.string :name
      t.decimal :price
      t.integer :quantity
    end
  end
end
