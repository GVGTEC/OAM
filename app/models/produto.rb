class Produto < ApplicationRecord
  belongs_to :empresa
  belongs_to :cliente
  belongs_to :fornecedor, optional: true
end
