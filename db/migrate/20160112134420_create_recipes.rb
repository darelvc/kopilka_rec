class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :title
    	t.text :summary
    	t.text :description
    	t.string :difficulty
    	t.string :pre_time
    	t.string :cook_time
    	t.string :servers
    	t.timestamps
    end
  end
end