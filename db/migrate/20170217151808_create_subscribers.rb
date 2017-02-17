class CreateSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.references :library, foreign_key: true, :null => false
      t.integer :ticket_number, :null => false
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.string :patronymic
      t.string :address, :null => false
      t.string :phone, :null => false

      t.timestamps
    end
    add_index :subscribers, :ticket_number, unique: true
  end
end
