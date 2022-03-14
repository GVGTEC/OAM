class RemoveProdutoToEntregaPedido < ActiveRecord::Migration[5.2]
  def change
    remove_reference :entrega_pedidos, :produto, index: true
  end
end
