class CreateEquities < ActiveRecord::Migration[5.1]
  def change
    create_table :equities do |t|
    	t.string :ticker
      t.string :company_name
      t.text :description
      t.decimal :roc
      t.decimal :rsi
      t.decimal :mfi
      t.decimal :adx
      t.decimal :obv
      t.decimal :sma
      t.decimal :ema
      t.decimal :stoch_d
      t.decimal :stoch_k
      t.decimal :price_data

    	t.timestamps
    end
  end
end
