class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
    	t.string :name, null: false
    	t.string :ingredients, null: false
    	t.decimal :price, :precision => 10, :scale => 2, null: false
    	t.integer :type, null: false
    	t.timestamps
    end
  end
end
