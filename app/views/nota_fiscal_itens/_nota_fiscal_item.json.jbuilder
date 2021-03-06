json.extract! nota_fiscal_item, :id, :nota_fiscal_id, :produto_id, :descricao, :cfop, :st, :ncm, :cst, :unidade,
              :quantidade, :preco_unitario, :preco_total, :aliquota_icms, :valor_bc_icms, :valor_icms, :aliquota_icms_st, :valor_bc_icms_st, :valor_icms_st, :aliquota_ipi, :valor_ipi, :aliquota_pis, :valor_pis, :aliquota_cofins, 
              :valor_cofins, :aliquota_difal, :valor_difal, :valor_fcp, :aliquota_fcp, :local_estoque, :baixou_estoque, :pagar_comissao_sn, :comissao_ven_pc, :comissao_ven_vr, :comissao_ter_pc, :comissao_ter_vr, :created_at, :updated_at
json.url nota_fiscal_nota_fiscal_item_path(@nota_fiscal, nota_fiscal_item, format: :json)
