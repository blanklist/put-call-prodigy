class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
    	t.string :ticker
    	t.integer :bought_at
    	t.integer :sold_at
    	t.references :user
      t.timestamps
    end
  end
end
