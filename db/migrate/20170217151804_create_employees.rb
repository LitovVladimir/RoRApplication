class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references :library, foreign_key: true, :null => false
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.string :patronymic
      t.date :DOB
      t.date :employment_date
      t.string :post, :null => false
      t.string :education

      t.timestamps
    end
  end
end
