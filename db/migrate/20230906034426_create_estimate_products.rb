class CreateEstimateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :estimate_products do |t|
      t.string     :estimate_number, null: false, default: "", unique: true
      t.string     :company_name,    null: false, default: ""
      t.integer    :total_price,     null: false
      t.string     :ancestry
      t.string     :summary
      t.integer    :unit_price
      t.integer    :quantity,        null: false
      t.references :user,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
