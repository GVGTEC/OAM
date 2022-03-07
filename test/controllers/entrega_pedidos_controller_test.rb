require 'test_helper'

class EntregaPedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrega_pedido = entrega_pedidos(:one)
  end

  test "should get index" do
    get entrega_pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_entrega_pedido_url
    assert_response :success
  end

  test "should create entrega_pedido" do
    assert_difference('EntregaPedido.count') do
      post entrega_pedidos_url, params: { entrega_pedido: { cliente_id: @entrega_pedido.cliente_id, data_entrega: @entrega_pedido.data_entrega, pedido_id: @entrega_pedido.pedido_id, produto_id: @entrega_pedido.produto_id, quantidade_entregue: @entrega_pedido.quantidade_entregue, quantidade_final: @entrega_pedido.quantidade_final, quantidade_inicial: @entrega_pedido.quantidade_inicial, quantidade_pedido: @entrega_pedido.quantidade_pedido } }
    end

    assert_redirected_to entrega_pedido_url(EntregaPedido.last)
  end

  test "should show entrega_pedido" do
    get entrega_pedido_url(@entrega_pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrega_pedido_url(@entrega_pedido)
    assert_response :success
  end

  test "should update entrega_pedido" do
    patch entrega_pedido_url(@entrega_pedido), params: { entrega_pedido: { cliente_id: @entrega_pedido.cliente_id, data_entrega: @entrega_pedido.data_entrega, pedido_id: @entrega_pedido.pedido_id, produto_id: @entrega_pedido.produto_id, quantidade_entregue: @entrega_pedido.quantidade_entregue, quantidade_final: @entrega_pedido.quantidade_final, quantidade_inicial: @entrega_pedido.quantidade_inicial, quantidade_pedido: @entrega_pedido.quantidade_pedido } }
    assert_redirected_to entrega_pedido_url(@entrega_pedido)
  end

  test "should destroy entrega_pedido" do
    assert_difference('EntregaPedido.count', -1) do
      delete entrega_pedido_url(@entrega_pedido)
    end

    assert_redirected_to entrega_pedidos_url
  end
end
