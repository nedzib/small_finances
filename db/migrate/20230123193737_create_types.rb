class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.string :code
      t.string :color
      t.integer :operation

      t.timestamps
    end
  end
end
