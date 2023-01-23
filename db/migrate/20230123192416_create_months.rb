class CreateMonths < ActiveRecord::Migration[7.0]
  def change
    create_table :months do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.boolean :active
      t.decimal :final_balance
      t.decimal :total_debt
      t.date :period

      t.timestamps
    end
  end
end
