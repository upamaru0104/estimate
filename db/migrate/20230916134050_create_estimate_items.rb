class CreateEstimateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :estimate_items do |t|
      t.string     :ancestry
      t.string     :summary
      t.integer    :unit_price

      t.timestamps
    end
  end
end
