require "application_system_test_case"

class EntregaPedidosTest < ApplicationSystemTestCase
  setup do
    @entrega_pedido = entrega_pedidos(:one)
  end

  test "visiting the index" do
    visit entrega_pedidos_url
    assert_selector "h1", text: "Entrega Pedidos"
  end

  test "creating a Entrega pedido" do
    visit entrega_pedidos_url
    click_on "New Entrega Pedido"

    fill_in "Cliente", with: @entrega_pedido.cliente_id
    fill_in "Data entrega", with: @entrega_pedido.data_entrega
    fill_in "Pedido", with: @entrega_pedido.pedido_id
    fill_in "Produto", with: @entrega_pedido.produto_id
    fill_in "Quantidade entregue", with: @entrega_pedido.quantidade_entregue
    fill_in "Quantidade final", with: @entrega_pedido.quantidade_final
    fill_in "Quantidade inicial", with: @entrega_pedido.quantidade_inicial
    fill_in "Quantidade pedido", with: @entrega_pedido.quantidade_pedido
    click_on "Create Entrega pedido"

    assert_text "Entrega pedido was successfully created"
    click_on "Back"
  end

  test "updating a Entrega pedido" do
    visit entrega_pedidos_url
    click_on "Edit", match: :first

    fill_in "Cliente", with: @entrega_pedido.cliente_id
    fill_in "Data entrega", with: @entrega_pedido.data_entrega
    fill_in "Pedido", with: @entrega_pedido.pedido_id
    fill_in "Produto", with: @entrega_pedido.produto_id
    fill_in "Quantidade entregue", with: @entrega_pedido.quantidade_entregue
    fill_in "Quantidade final", with: @entrega_pedido.quantidade_final
    fill_in "Quantidade inicial", with: @entrega_pedido.quantidade_inicial
    fill_in "Quantidade pedido", with: @entrega_pedido.quantidade_pedido
    click_on "Update Entrega pedido"

    assert_text "Entrega pedido was successfully updated"
    click_on "Back"
  end

  test "destroying a Entrega pedido" do
    visit entrega_pedidos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entrega pedido was successfully destroyed"
  end
end
