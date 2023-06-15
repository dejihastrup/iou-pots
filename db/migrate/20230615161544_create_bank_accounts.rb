class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.string :full_name
      t.integer :account_number
      t.string :sort_code
      t.references :user, null: false, foreign_key: true
      t.string :bank

      t.timestamps
    end
  end
end
