class ChangeMonths < ActiveRecord::Migration[7.0]
  def change
    change_table :months do |t|
      t.references :user_group, null: false, foreign_key: { to_table: :user_groups }
    end
    change_table :types do |t|
      t.references :user_group, null: false, foreign_key: { to_table: :user_groups }
    end
  end
end
