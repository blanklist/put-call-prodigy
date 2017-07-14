class CreateRobots < ActiveRecord::Migration[5.1]
  def change
    create_table :robots do |t|
      t.string :name
      t.string :summon
      t.integer :user_id

      t.timestamps
    end
  end
end
