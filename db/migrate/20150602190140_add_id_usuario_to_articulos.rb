class AddIdUsuarioToArticulos < ActiveRecord::Migration
  def change
    add_reference :articulos, :usuario, index: true, foreign_key: true
  end
end
