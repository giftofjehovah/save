class CreateRecurringTransactions < ActiveRecord::Migration
  def change
    create_table :recurring_transactions do |t|
    	t.string :name
    	t.float :amount
    	t.string :kind
    	t.string :duration
    	t.integer :start_date

    	t.integer :user_id
    	t.integer :account_id
      t.timestamps null: false
    end
  end
end
