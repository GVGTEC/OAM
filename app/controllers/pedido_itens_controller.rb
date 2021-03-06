class PedidoItensController < ApplicationController
  before_action :set_pedido_item, only: %i[show edit update destroy]
  before_action :set_pedido, except: [:lista_por_previsao_entrega]

  def index
    @pedido_itens = PedidoItem.where(pedido_id: @pedido.id)
  end

  def lista_por_previsao_entrega
    @pedido_itens = PedidoItem.all.order("data_previsao_entrega ASC")

    #@pedidos.itens = @pedidos.itens.order("data_previsao_entrega ASC")

    # EM MovimentoEstoquesController TEM A ROTINA PARA FILTRAR POR DATA

    #debugger
  end

  # helper_method :getPedidoItens
  # def getPedidoItens(id)
  #   @pedidoitens = PedidoItem.where(pedido_id: id)
  #   #@pedidoitens = PedidoItem.find_by(id)

  #   debugger
  # end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @pedido_item = PedidoItem.new

    @produtos = Produto.where(empresa_id: @adm.empresa.id)
    @produtos = @produtos.where(cliente_id: @pedido.cliente_id)
    @produtos = @produtos.order('descricao asc')

    #@produtos = @produtos.joins('inner join estoques on estoques.produto_id = produtos.id')
    #@produtos = @produtos.having("sum(estoques.estoque_atual_lote) > '0'").group(:id, :descricao)
  end

  def edit; end

  def create
    if params[:pedido].key?(:pedido_item)
      @pedido.itens.destroy_all

      params[:pedido][:pedido_item].each do |pedido_item|
        next if pedido_item[:cod_produto].blank?

        begin
          produto = Produto.find_by(codigo_produto: pedido_item[:cod_produto])
          @pedido_item = @pedido.itens.new(
            produto_id: produto.id,
            quantidade: pedido_item[:qtd],
            preco_unitario: formatar_preco(pedido_item[:preco_unitario]),
            preco_total: formatar_preco(pedido_item[:preco_total]),
            data_previsao_entrega: pedido_item[:data_previsao_entrega]
          )
          
          @pedido_item.save
        rescue StandardError => e
          flash[:error] = 'Erro no cadastramento. Verifique se todos os campos estão prenchidos corretamente.'
          redirect_to new_pedido_pedido_item_path(@pedido)
          return
        end
      end

      @pedido.valor_total = @pedido.itens.sum(:preco_total)
      #@pedido.valor_total = @pedido.calculo_valor_total_nota
      #@pedido.valor_total = @pedido.valor_sub_total.to_f - @pedido.valor_desconto.to_f
      @pedido.save

      #debugger

      #salvar_estoque
    end

    respond_to do |format|
      format.html do
        #redirect_to new_pedido_pedido_duplicata_path(@pedido), notice: 'Orçamento Item Cadastrado'
        redirect_to '/pedidos'
      end
    end
  end

  # PATCH/PUT /pedido_itens/1 or /pedido_itens/1.json
  def update
    respond_to do |format|
      if @pedido_item.update(pedido_item_params)
        format.html { redirect_to @pedido_item, notice: 'Pedido Item Alterado' }
        format.json { render :show, status: :ok, location: @pedido_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pedido_item.destroy
    respond_to do |format|
      format.html { redirect_to pedido_itens_url, notice: 'Pedido Item Excluído' }
      format.json { head :no_content }
    end
  end

  private

  def set_pedido_item
    @pedido_item = PedidoItem.find(params[:id])
  end

  def set_pedido
    @pedido = Pedido.find(params[:pedido_id])
  end

  def formatar_preco(valor)
    valor.tr('R$', '').tr('.', '').tr(',', '.').to_f
  end

  def pedido_item_params
    params.require(:pedido_item).permit(:pedido_id, :produto_id, :quantidade, :preco_unitario, :preco_total)
  end
end
