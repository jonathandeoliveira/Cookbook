class CreateRecipeTypnes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_typnes do |t|
      t.string :name

      t.timestamps
    end
  end
end
