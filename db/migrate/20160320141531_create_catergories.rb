class CreateCatergories < ActiveRecord::Migration
  def change
    create_table :catergories do |t|
    	t.string :name
    	t.string :icon
      t.timestamps null: false
    end
  end
end
