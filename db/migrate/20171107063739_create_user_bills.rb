class CreateUserBills < ActiveRecord::Migration[5.1]
  def change
    create_table :user_bills do |t|
      t.references :user, foreign_key: true
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
