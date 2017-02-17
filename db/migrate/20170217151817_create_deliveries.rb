class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.references :book, foreign_key: true, :null => false
      t.references :subscriber, foreign_key: true, :null => false
      t.date :delivery_date, :null => false
      t.date :return_date

      t.timestamps
    end
  end
end
