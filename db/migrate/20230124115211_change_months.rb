class ChangeMonths < ActiveRecord::Migration[7.0]
  def change
    change_table :months do |t|
      t.references :user_group, null: false, foreign_key: { to_table: :user_groups }
    end
    change_table :types do |t|
      t.references :user_group, null: false, foreign_key: { to_table: :user_groups }
    end
    create_table :user_groups_users do |t|
      t.bigint :user_id
      t.bigint :user_group_id
    end
    add_index :user_groups_users, :user_id
    add_index :user_groups_users, :user_group_id
  end
end
