json.extract! pedido_item, :id, :pedido_id, :produto_id, :quantidade, :preco_unitario, :preco_total, :created_at,
              :updated_at
json.url pedido_item_url(pedido_item, format: :json)
