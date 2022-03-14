class EntregaPedido < ApplicationRecord
  belongs_to :pedido_item
  after_save :atualizar_qtd_entregue

  private

  def atualizar_qtd_entregue
    item = self.pedido_item
    item.quantidade_entregue = item.entregas.sum(:quantidade_entregue)
    item.save
  end
end
