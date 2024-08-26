class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|

      t.string :name, null: false
      t.string :email, limit: 255, null: false
      t.string :password_digest, limit: 255
      t.integer :role, null: false

      t.timestamps
    end
  end
end
