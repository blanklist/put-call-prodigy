class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
    	t.string :ticker
    	t.references :contract
    	t.timestamps
    end
  end
end
