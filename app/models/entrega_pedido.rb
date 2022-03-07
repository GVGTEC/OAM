class EntregaPedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :cliente
  belongs_to :produto
end
