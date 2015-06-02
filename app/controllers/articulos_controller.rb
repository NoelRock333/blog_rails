class ArticulosController < ApplicationController
	#GET /articulos
	def index
		@articulos = Articulo.all
	end

	#GET /articulos/:id
	def show
		@articulo = Articulo.find(params[:id]) #Obtiene el parametro id que viene en la url
		#Where
		#Articulo.where(" id = ? ", params[:id]) #Debe traernos el mismo resultado que la consulta de arriba
		#Articulo.where(" cuerpo LIKE ? ", "%hola%") #Debe traernos todos los registros que contengan "hola" en el cuerpo
		#Articulo.where("id = ? AND titulo = ?", params[:id], params[:titulo]) #Debe traernos los articulos donde coincidan el campo id y titulo
		#Articulo.where("id = #{params[:id]}") #Podriamos interpolar la cadena que viene en el parametro directamente pero nos hace suceptibles a SQLInjection
		#Articulo.where.not(" id = 1 ") #Nos debe traer todos los articulos que tengan id diferente de 1
	end

	def edit
		@articulo = Articulo.find(params[:id])
	end

	#GET /articulos/new
	def new
		@articulo = Articulo.new #Crea una instancia del modelo Articulo
	end

	#POST /articulos
	def create
		@articulo = current_usuario.articulos.new(articulo_params) #Se lo pasamos directamente porque el hash tiene la misma estructura { titulo: "Titulo", cuerpo: "Cuerpo"}
		
		#Tambien podriamos usar el metodo @articulo.valid? o @articulo.invalid?
		#Si no se puede guardar el articulo, se vuelve a mostrar la vista new
		if @articulo.save
			redirect_to @articulo #Nos redirige
		else
			render :new #No nos mueve de acción, simplemente le dice que use la vista :new
		end
	end

	#DELETE /articulos/:id
	def destroy
		@articulo = Articulo.find(params[:id])
		@articulo.destroy #Destroy elimina el articulo de la Base de Datos
		redirect_to articulos_path
	end

	#PUT /articulos/:id
	def update
		#@articulo.update_attributes({ titulo: "Nuevo titulo" })
		@articulo = Articulo.find(params[:id])
		if @articulo.update(articulo_params)
			redirect_to @articulo
		else
			render :edit
		end
	end

	private

	def articulo_params
		#{
		#	articulo: {
		#		titulo: ,
		#		cuerpo: 
		#	}
		#}
		params.require(:articulo).permit(:titulo, :cuerpo)
	end
end