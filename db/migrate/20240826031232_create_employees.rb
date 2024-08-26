class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false
      t.string :designation, null: false
      t.references :department, foreign_key: true, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
