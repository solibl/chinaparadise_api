class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
    	t.string :name, null: false
    	t.string :ingredients, null: false
    	t.money :price, :precision => 10, :scale => 2, null: false
    	t.integer :category, null: false
    	t.timestamps
    end
  end
end
