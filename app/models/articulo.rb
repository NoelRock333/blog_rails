class Articulo < ActiveRecord::Base
	validates :titulo, presence: true, uniqueness: true #Valida que el elemento no venga vacio y que no se repita
	validates :cuerpo, presence: true, length: { minimum: 20 } #Valida que el campo cuerpo no esté vacio y que contenga un minimo de 20 caracteres
	#validates :username, format: { with: /regex/ } #Validacion con expresión regular
end
