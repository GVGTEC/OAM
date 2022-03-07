json.extract! entrega_pedido, :id, :pedido_id, :cliente_id, :produto_id, :data_entrega, :quantidade_pedido, :quantidade_inicial, :quantidade_entregue, :quantidade_final, :created_at, :updated_at
json.url entrega_pedido_url(entrega_pedido, format: :json)
