class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.string :bill_type, null: false
      t.float :amount, null: false
      t.integer :status
      t.references :employee, foreign_key: true, null: false

      t.timestamps
    end
  end
end
