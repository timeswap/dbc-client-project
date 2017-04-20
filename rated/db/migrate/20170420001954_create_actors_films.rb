class CreateActorsFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :actors_films do |t|
      t.references :film, foreign_key: true
      t.references :actor, foreign_key: true

      t.timestamps
    end
  end
end
