class CreateMonthLines < ActiveRecord::Migration[7.0]
  def change
    create_table :month_lines do |t|
      t.references :month, null: false, foreign_key: { to_table: :months }
      t.references :type, null: false, foreign_key: { to_table: :types }
      t.string :concept
      t.decimal :value
      t.string :additional_info
      t.boolean :paid

      t.timestamps
    end
  end
end
