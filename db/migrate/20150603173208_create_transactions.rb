class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :organization
      t.boolean :is_credit
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
