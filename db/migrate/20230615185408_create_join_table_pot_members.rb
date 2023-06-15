class CreateJoinTablePotMembers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :pots, table_name: :pot_members do |t|
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
