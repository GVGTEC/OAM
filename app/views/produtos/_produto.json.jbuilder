json.extract! produto, :id, :localizacao_estoque_id, :situacao, :data_inativo, :descricao, :descricao_complementar,
              :codigo_barras, :ncm, :situacao_tributaria, :unidade, :embalagem, :controlar_estoque, :por_lote, :bloquear_preco, :data_ultima_reposicao, :data_ultimo_reajuste, :preco_custo, 
              :preco_custo_medio, :margem_lucro, :preco_venda, :preco_oferta, :margem_lucro_oferta, :data_inicial_oferta, :data_final_oferta, :comissao_pc, :estoque_atual, :estoque_minimo, :created_at, :updated_at
json.url produto_url(produto, format: :json)
