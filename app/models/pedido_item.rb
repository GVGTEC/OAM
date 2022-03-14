class PedidoItem < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto

  has_many :entregas, class_name: 'EntregaPedido',  dependent: :destroy
end
