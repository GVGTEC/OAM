class EntregaPedidosController < ApplicationController
  before_action :set_entrega_pedido, only: %i[ show edit update destroy ]
  # before_action :set_pedido

  # GET /entrega_pedidos or /entrega_pedidos.json
  def index
    @entrega_pedidos = EntregaPedido.all
  end

  # GET /entrega_pedidos/1 or /entrega_pedidos/1.json
  def show
  end

  # GET /entrega_pedidos/new
  def new
    @entrega_pedido = EntregaPedido.new
  end

  # GET /entrega_pedidos/1/edit
  def edit
  end

  # POST /entrega_pedidos or /entrega_pedidos.json
  def create
    @entrega_pedido = EntregaPedido.new(entrega_pedido_params)

    respond_to do |format|
      if @entrega_pedido.save
        format.html { redirect_to entrega_pedido_url(@entrega_pedido), notice: "Entrega pedido was successfully created." }
        format.json { render :show, status: :created, location: @entrega_pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrega_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrega_pedidos/1 or /entrega_pedidos/1.json
  def update
    respond_to do |format|
      if @entrega_pedido.update(entrega_pedido_params)
        format.html { redirect_to entrega_pedido_url(@entrega_pedido), notice: "Entrega pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @entrega_pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entrega_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrega_pedidos/1 or /entrega_pedidos/1.json
  def destroy
    @entrega_pedido.destroy

    respond_to do |format|
      format.html { redirect_to entrega_pedidos_url, notice: "Entrega pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_pedido
      @pedido = Pedido.find(params[:pedido_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_entrega_pedido
      @entrega_pedido = EntregaPedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entrega_pedido_params
      params.require(:entrega_pedido).permit(:pedido_id, :cliente_id, :produto_id, :data_entrega, :quantidade_pedido, :quantidade_inicial, :quantidade_entregue, :quantidade_final)
    end
end
