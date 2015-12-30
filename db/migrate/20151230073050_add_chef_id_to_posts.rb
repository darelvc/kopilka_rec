class AddChefIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :chef_id, :integer
  end
end
