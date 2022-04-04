class AddNotafiscalToEntregaPedidos < ActiveRecord::Migration[5.2]
  def change
    add_column :entrega_pedidos, :nota_fiscal, :string
  end
end
