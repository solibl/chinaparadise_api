class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
    	t.string :name, null: false
    	t.string :ingredients, null: false
    	t.decimal :price, null: false, :precision => 10, :scale => 2
    	t.timestamps
    end
  end
end
