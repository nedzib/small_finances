class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|
      t.string :name
      t.string :code
      t.string :color
      t.integer :operator

      t.timestamps
    end
  end
end
