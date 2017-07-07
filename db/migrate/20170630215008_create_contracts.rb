class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :ticker
      t.float :strike_price
      t.float :spot_price
      t.integer :interval
      t.float :gain_loss
      t.references :user
      t.timestamps
    end
  end
end
