class EntregaPedido < ApplicationRecord
  belongs_to :pedido_item
  belongs_to :cliente
  belongs_to :produto

end
