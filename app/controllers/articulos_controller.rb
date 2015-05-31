class ArticulosController < ApplicationController
	#GET /articulos
	def index
		@articulos = Articulo.all
	end

	#GET /articulos/:id
	def show
		@articulo = Articulo.find(params[:id])
	end
end