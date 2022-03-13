class Pedido < ApplicationRecord
  belongs_to :cliente
  belongs_to :vendedor
  belongs_to :empresa, optional: true

  has_many :itens, class_name: 'PedidoItem',  dependent: :destroy
end
