class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.string :name
    	t.float :balance
    	t.string :type_of_account
    	t.float :limit
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
