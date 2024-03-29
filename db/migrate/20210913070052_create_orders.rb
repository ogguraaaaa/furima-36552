class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :purchase_history,      null: false, foreign_key: true
      t.string :postal_code,               null: false
      t.string :number,                    null: false
      t.string :city,                      null: false
      t.string :address,                   null: false
      t.string :building
      t.integer :prefecture_id,            null: false
      t.timestamps
    end
  end
end
