class AddBillRefToBills < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :bill_ref, :string
  end
end
