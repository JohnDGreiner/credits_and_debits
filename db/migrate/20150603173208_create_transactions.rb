class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :organization
      t.boolean :is_credit
      t.decimal :amount, precision: 30, :scale => 2

      t.timestamps null: false
    end
  end
end
