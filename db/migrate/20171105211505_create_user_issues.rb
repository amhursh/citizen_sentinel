class CreateUserIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :user_issues do |t|
      t.references :user, foreign_key: true
      t.references :issue, foreign_key: true

      t.timestamps
    end
  end
end
