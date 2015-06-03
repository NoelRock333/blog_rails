class Articulo < ActiveRecord::Base
	belongs_to :usuario
	validates :titulo, presence: true, uniqueness: true #Valida que el elemento no venga vacio y que no se repita
	validates :cuerpo, presence: true, length: { minimum: 20 } #Valida que el campo cuerpo no esté vacio y que contenga un minimo de 20 caracteres
	#validates :username, format: { with: /regex/ } #Validacion con expresión regular
	before_save :set_visits_count #tambien existen otros metodos como "before_save", "before_validation", "after_create", "afeter_save", "after_save :privada, on: :create" entre otros

	def update_visits_count
		#Aqui no estamos guardando nada, pero si el contador de visitas es igual a 'nil' entonces dispara el 'before_save' 
		#que a su vez ejecuta el 'set_visits_count' para tomar el valor actual, pero si viene 'nil' entonces toma un 0 
		#y luego ya incrementa en 1 y guarda la modificación
		self.save if self.contador_visitas.nil?
		self.update(contador_visitas: self.contador_visitas + 1) #Le decimos que actualice el contador de visitas con el valor del contador de visitas mas uno
	end

	private

	def set_visits_count
		self.contador_visitas ||= 0 
	end
end
