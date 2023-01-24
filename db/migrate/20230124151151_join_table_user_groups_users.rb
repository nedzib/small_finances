class JoinTableUserGroupsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_groups_users do |t|
      t.bigint :user_id
      t.bigint :user_group_id
    end
    add_index :user_groups_users, :user_id
    add_index :user_groups_users, :user_group_id
  end
end
