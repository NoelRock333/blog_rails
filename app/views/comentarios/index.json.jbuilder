json.array!(@comentarios) do |comentario|
  json.extract! comentario, :id, :usuario_id, :articulo_id, :cuerpo
  json.url comentario_url(comentario, format: :json)
end
