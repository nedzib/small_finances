class CreateUserGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :user_groups do |t|
      t.string :name, null: false
      t.string :description
      t.timestamps
    end
  end
end
