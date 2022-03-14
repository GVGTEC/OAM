class RemoveClienteToEntregaPedido < ActiveRecord::Migration[5.2]
  def change
    remove_reference :entrega_pedidos, :cliente, index: true
  end
end
