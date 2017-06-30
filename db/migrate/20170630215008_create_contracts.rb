class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :figi
      t.integer :strike_price
      t.datetime :interval
      t.references :user
      t.timestamps
    end
  end
end
