class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.references :user, foreign_key: true
      t.references :rateable, polymorphic: true

      t.timestamps
    end
  end
end
