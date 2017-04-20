class CreateCategoriesFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_films do |t|
      t.references :film, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
