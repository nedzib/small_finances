class CreateMonths < ActiveRecord::Migration[7.0]
  def change
    create_table :months do |t|
      t.boolean :active, :default => false
      t.decimal :final_balance, :default => 0.0
      t.decimal :total_debt, :default => 0.0
      t.date :period

      t.timestamps
    end
  end
end
