class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
    	t.string    :ticker
      t.string    :company_name
      t.text      :description
      t.decimal   :roc
      t.decimal   :rsi
      t.decimal   :stoch_d
      t.decimal   :stoch_k
      t.decimal   :bbands_low
      t.decimal   :bbands_mid
      t.decimal   :bbands_high
      t.text      :price_data
    	t.references   :contract

    	t.timestamps
    end
  end
end
