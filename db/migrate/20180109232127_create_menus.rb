class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
    	t.string :name, null: false
    	t.string :ingredients
    	t.string :price, null: false
    	t.integer :category, null: false
    	t.timestamps
    end
  end
end
