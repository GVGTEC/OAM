json.extract! empresa, :id, :nome, :nome_fantasia, :cnpj, :inscricao_estadual, :inscricao_municipal, :endereco,
              :numero, :complemento, :bairro, :cidade, :cep, :uf, :telefone, :email, :codigo_uf_emitente, :codcid_ibge, :aliquota_pis, :aliquota_cofins, :serie_nfe, :cnae, :ambiente, :versao_layout, :regime_tributario, 
              :emissor_nfe, :permite_credito_icms, :credito_icms_pc, :empresa_uninfe, :pasta_envio, :pasta_retorno, :senha, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)
