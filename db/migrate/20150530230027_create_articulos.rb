class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.text :cuerpo
      t.integer :contador_visitas

      t.timestamps null: false
    end
  end
end
