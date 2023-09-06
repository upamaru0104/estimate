class CreateEstimateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :estimate_products do |t|
      t.string :estimate_number,              null: false, default: "", unique: true
      t.date   :estimate_date,              null: false, default: ""
      t.string :estimate_number,              null: false, default: ""
      t.integer :total_price,              null: false
      t.string :ancestry,              null: false, default: ""
      t.integer :quantity,              null: false
      t.references :user,              null: false, default: "", foreign_key: true

      t.timestamps
    end
  end
end
