class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :ticker
      t.integer :strike_price
      t.integer :interval
      t.references :user
      t.timestamps
    end
  end
end
