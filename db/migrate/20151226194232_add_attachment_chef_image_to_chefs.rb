class AddAttachmentChefImageToChefs < ActiveRecord::Migration
  def self.up
    change_table :chefs do |t|
      t.attachment :chef_image
    end
  end

  def self.down
    remove_attachment :chefs, :chef_image
  end
end
