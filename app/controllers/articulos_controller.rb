class ArticulosController < ApplicationController
	#GET /articulos
	def index
		@articulos = Articulo.all
	end

	#GET /articulos/:id
	def show
		@articulo = Articulo.find(params[:id]) #Obtiene el parametro id que viene en la url
	end

	#GET /articulos/new
	def new
		@articulo = Articulo.new #Crea una instancia del modelo Articulo
	end

	#POST /articulos
	def create
		@articulo = Articulo.new(titulo: params[:articulo][:titulo], cuerpo: params[:articulo][:cuerpo])
		#Tambien podriamos usar el metodo @articulo.valid? o @articulo.invalid?
		#Si no se puede guardar el articulo, se vuelve a mostrar la vista new
		if @articulo.save
			redirect_to @articulo #Nos redirige
		else
			render :new #No nos mueve de acción, simplemente le dice que use la vista :new
		end
	end
end