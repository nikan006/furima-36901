class CreateFees < ActiveRecord::Migration[6.0]
  def change
    create_table :fees do |t|
      t.integer :fee_id,  null:false
      t.timestamps
    end
  end
end
