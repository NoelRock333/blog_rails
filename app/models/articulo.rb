class Articulo < ActiveRecord::Base
	belongs_to :usuario
	has_many :comentarios
	validates :titulo, presence: true, uniqueness: true #Valida que el elemento no venga vacio y que no se repita
	validates :cuerpo, presence: true, length: { minimum: 20 } #Valida que el campo cuerpo no esté vacio y que contenga un minimo de 20 caracteres
	#validates :username, format: { with: /regex/ } #Validacion con expresión regular
	before_save :set_visits_count #tambien existen otros metodos como "before_save", "before_validation", "after_create", "afeter_save", "after_save :privada, on: :create" entre otros

	def update_visits_count
		#self.save if self.contador_visitas.nil?  #Una vez ya teniendo todos los registros con valor diferente de nil en la base de datos, ahora si podemos borrar esta linea
		self.update(contador_visitas: (self.contador_visitas || 0) + 1) #Le decimos que actualice el contador de visitas con el valor del contador de visitas mas uno
	end

	private

	def set_visits_count
		self.contador_visitas ||= 0 #Inicia el campo contador_visitas en 0 en dado caso de que no traiga nada
	end
end
