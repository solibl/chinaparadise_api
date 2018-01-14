class AddAttachmentPictureToMenus < ActiveRecord::Migration[5.0]
  def self.up
    change_table :menus do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :menus, :picture
  end
end
