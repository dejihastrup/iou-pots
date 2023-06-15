class CreatePots < ActiveRecord::Migration[7.0]
  def change
    create_table :pots do |t|
      t.string :title
      t.string :description
      t.float :total_amount
      t.boolean :cleared
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.datetime :date

      t.timestamps
    end
  end
end
