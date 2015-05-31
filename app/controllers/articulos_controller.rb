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

	#POST /articulos/create
	def create
		@articulo = Articulo.new(titulo: params[:articulo][:titulo], cuerpo: params[:articulo][:cuerpo])
		@articulo.save
		redirect_to @articulo
	end
end