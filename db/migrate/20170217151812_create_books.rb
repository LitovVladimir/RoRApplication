class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :library, foreign_key: true, :null => false
      t.string :name, :null => false
      t.string :author
      t.string :cipher, :null => false
      t.string :publishing_house
      t.integer :publishing_year
      t.float :price
      t.date :receipt_date

      t.timestamps
    end
    add_index :books, :cipher, unique: true
  end
end
