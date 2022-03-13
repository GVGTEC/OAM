class CreateEntregaPedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :entrega_pedidos do |t|
      t.references :pedido_item, foreign_key: true
      t.references :cliente, foreign_key: true
      t.references :produto, foreign_key: true
      t.date :data_entrega
      t.string :quantidade_pedido
      t.integer :quantidade_inicial
      t.integer :quantidade_entregue
      t.integer :quantidade_final

      t.timestamps
    end
  end
end
