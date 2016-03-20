class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.string :name
    	t.integer :balance
    	t.string :type_of_account
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
