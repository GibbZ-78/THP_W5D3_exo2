class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :album
      t.string :artist
      t.integer :duration   # durée de la chanson (en millisecondes)
      t.integer :size       # taille (en octets) de la chanson
      t.float :price
      t.timestamps
    end
  end
end
