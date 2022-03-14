class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[show edit update destroy]

#  if params[:gerar_pdf].present?
#    render pdf: "Invoice No",
#    page_size: "A4"
#    template: "pedidos/index.pdf.erb",
#    layout: "pdf.html.erb
#    lowquality: true,
#    zoom:1
#    dpi: 75
#    return
#  end

#  def relatorio
#    render pdf: "file",
#    template: "pedido/relatorio.pdf.erb",
#    #layout: "pdf.html.erb"
#    #layout: "relatorio.pdf.erb"
#    layout: "application.pdf.ebr"
#  end

  def index
    #@nota_fiscais = empresa.nota_fiscais (HABILITAR QUANDO CRIAR O CAMPO EMPRESA NO ORCAMENTO)
    @pedidos = Pedido.all

    # if params[:pedido_cliente].present?
    #   @pedido = @pedido.joins(:cliente).where("lower(cliente.nome) ilike ?", "%#{params[:pedido_cliente].downcase}%")
    # end

    @pedidos = @pedidos.order(created_at: :desc)
   
    # @pedidos = Pedido.where(empresa_id: @adm.empresa.id)   O CAMPO EMPRESA_ID AINDA NÃO EXISTE NA TABELA DE ORÇAMENTO

    options = { page: params[:page] || 1, per_page: 50 }
    @pedidos = @pedidos.paginate(options)
  end

  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        #render pdf: "file name", template: "produtos/show.html.erb"
        render pdf: "Pedido id: #{@pedido.id}", template: "pedidos/relatorio.pdf.html.erb"
      end
    end
  end

  def new
    @pedido = Pedido.new
    @pedido.data_emissao = Time.zone.now.strftime('%Y-%m-%dT%H:%M')
  end

  def edit; end

  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save

        # format.html { redirect_to @pedido, notice: "Orçamento Cadastrado" }
        format.html { redirect_to new_pedido_pedido_item_path(@pedido)}
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        #format.html { redirect_to @pedido, notice: 'Orçamento Alterado' }
        format.html { redirect_to new_pedido_pedido_item_path(@pedido), notice: '' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido Excluído' }
      format.json { head :no_content }
    end

  rescue
    redirect_to pedidos_path, notice: "Pedido possui entregas"
  end

  private

  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  def pedido_params
    params.require(:pedido).permit(:cliente_id, :vendedor_id, :data_emissao, :valor_sub_total, :valor_desconto, :valor_total, :observacao, :flag)
  end
end
