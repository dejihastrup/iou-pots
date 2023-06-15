class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :message
      t.float :amount
      t.boolean :paid

      t.timestamps
    end
  end
end
