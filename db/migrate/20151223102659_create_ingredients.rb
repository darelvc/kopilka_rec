class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity
      t.belongs_to :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :ingredients, :recipes
  end
end
