class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string  :ticker
      t.float   :strike_price
      t.float   :spot_price
      t.integer :interval
      t.float   :gain_loss
      t.datetime      :expiration_date
      t.integer       :status
      t.references    :user
      t.references    :equity
      t.timestamps
    end
  end
end
