class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.references :usuario, index: true, foreign_key: true
      t.references :articulo, index: true, foreign_key: true
      t.text :cuerpo

      t.timestamps null: false
    end
  end
end
