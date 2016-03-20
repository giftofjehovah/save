class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
    	t.string :name
    	t.integer :amount
    	t.integer :user_id
    	t.integer :catergory_id
    	t.integer :account_id
    	
      t.timestamps null: false
    end
  end
end
