class CreateLibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :libraries do |t|
      t.integer :number, :null => false
      t.string :name, :null => false
      t.string :address, :null => false

      t.timestamps
    end
  end
end
