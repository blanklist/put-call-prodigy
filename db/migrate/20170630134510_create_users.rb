class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :username, null: false
      t.string :email, null: false
    	t.string :password_digest, null: false
      t.decimal :bank
      t.integer :bankruptcy_count, default: 0
      t.boolean :first_time, default: true
    
      t.timestamps
    end
  end
end
