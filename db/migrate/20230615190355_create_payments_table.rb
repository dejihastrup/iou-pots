class CreatePaymentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :payments_tables do |t|
      t.float :amount
      t.references :request, null: false, foreign_key: true
      t.references :sender_account, null: false, foreign_key: { to_table: :bank_accounts }
      t.references :reciever_account, null: false, foreign_key: { to_table: :bank_accounts }

      t.timestamps
    end
  end
end
