class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string :bill_id
      t.string :title
      t.string :subject
      t.boolean :active

      t.timestamps
    end
  end
end
