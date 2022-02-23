class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.references :cliente, foreign_key: true
      t.references :vendedor, foreign_key: true
      t.datetime :data_emissao
      t.datetime :prazo_previsao_entrega
      t.datetime :data_previsão_entrega
      t.float :valor_total
      t.text :observacao
      t.string :flag

      t.timestamps
    end
  end
end
