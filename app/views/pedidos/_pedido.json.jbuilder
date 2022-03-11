json.extract! pedido, :id, :vendedor_id, :data_emissao, :valor_total, :observacao, :flag
json.cliente do
    json.id pedido.cliente.id
    json.nome pedido.cliente.nome
end

json.itens pedido.pedido_itens do |item|
    json.id item.id
    json.quantidade item.quantidade
    json.entregue item.quantidade_entregue
    json.preco_unitario item.preco_unitario
    json.produto do
        json.id item.produto.id
        json.descricao item.produto.descricao
    end
end

json.produtos pedido.pedido_itens.map(&:produto)