class CreatePedidoItens < ActiveRecord::Migration[5.2]
  def change
    create_table :pedido_itens do |t|
      t.references :pedido, foreign_key: true
      t.references :produto, foreign_key: true
      t.float :quantidade
      t.float :quantidade_entregue
      t.float :preco_unitario
      t.float :preco_total

      t.timestamps
    end
  end
end
