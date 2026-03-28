class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :account, null: false
      t.string :user_name, null: false
      t.text :description
      t.string :password_digest, null: false
      t.date :birth_of_date
      t.timestamps
    end
    add_index :users, :account, unique: true
  end
end
