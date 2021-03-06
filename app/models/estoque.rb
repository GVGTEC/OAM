class Estoque < ApplicationRecord
  belongs_to :produto
  belongs_to :fornecedor, optional: true
  belongs_to :empresa

  VENDA = 'VDA'.freeze
  AJUSTE = 'AJU'.freeze
  REPOSICAO = 'REP'.freeze
  BAIXA = 'BAI'.freeze

  def calculo_preco_custo_medio
    produto = self.produto
    relacao_estoque_atual = produto.estoque_atual * produto.preco_custo rescue 0
    relacao_estoque_reposicao = estoque_atual_lote * preco_custo_reposicao.to_i rescue 0
    qtd_total_estoque = produto.estoque_atual + estoque_atual_lote
    qtd_relacao = relacao_estoque_atual + relacao_estoque_reposicao
    preco_custo_medio = qtd_relacao / qtd_total_estoque rescue 0
    preco_custo_medio.ceil(2)
  end

  def atualizar_produto_reposicao(params = {})
    produto = self.produto
    produto.preco_custo_medio = calculo_preco_custo_medio
    produto.estoque_atual += estoque_atual_lote
    produto.preco_custo = preco_custo_reposicao
    produto.margem_lucro = params[:margem_lucro]
    produto.preco_venda = params[:preco_venda]
    produto.save
  end

  def atualizar_produto_ajuste(qtd_estoque_final)
    produto = self.produto
    produto.estoque_atual = qtd_estoque_final
    produto.save
  end

  def atualizar_produto_baixas(params = {})
    produto = self.produto
    produto.estoque_atual -= params[:qtd_baixa].to_f
    produto.save
  end

  def self.formatar_data(data)
    dia = data[0..1].to_i
    mes = data[2..3].to_i
    ano = data[4..7].to_i

    return "" if dia.zero?

    Date.new(ano, mes, dia)
  rescue => e
    puts "============="
    puts e.to_s
    puts "============="
  end
end
