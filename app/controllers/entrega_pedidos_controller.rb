class EntregaPedidosController < ApplicationController
  before_action :set_pedido, :set_pedido_item
  before_action :set_entrega_pedido, only: %i[ show edit update destroy ]

  def index
    @entregas = @item.entregas
  end

  def show
  end

  def new
    @entrega = @item.entregas.new
  end

  def edit
  end

  def create
    @entrega = @item.entregas.build(entrega_pedido_params)

    respond_to do |format|
      if @entrega.save
        format.html { redirect_to pedido_pedido_item_entrega_pedidos_path(@pedido, @item), notice: "Entrega pedido was successfully created." }
        format.json { render :show, status: :created, location: @entrega }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entrega.update(entrega_pedido_params)
        format.html { redirect_to pedido_pedido_item_entrega_pedidos_path(@pedido, @item), notice: "Entrega pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @entrega }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entrega.destroy

    respond_to do |format|
      format.html { redirect_to pedido_pedido_item_entrega_pedidos_path(@pedido, @item), notice: "Entrega pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_pedido
      @pedido = Pedido.find(params[:pedido_id])
    end

    def set_pedido_item
      @item = @pedido.itens.find(params[:pedido_item_id])
    end

    def set_entrega_pedido
      @entrega = @item.entregas.find(params[:id])
    end

    def entrega_pedido_params
      params.require(:entrega_pedido).permit(:data_entrega, :quantidade_pedido, :quantidade_inicial, :quantidade_entregue, :quantidade_final)
    end
end
