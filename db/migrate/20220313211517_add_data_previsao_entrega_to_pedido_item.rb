class AddDataPrevisaoEntregaToPedidoItem < ActiveRecord::Migration[5.2]
  def change
    add_column :pedido_itens, :data_previsao_entrega, :date
  end
end
