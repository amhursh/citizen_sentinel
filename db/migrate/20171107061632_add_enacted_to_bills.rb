class AddEnactedToBills < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :enacted, :boolean
  end
end
