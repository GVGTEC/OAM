class EstoquesController < ApplicationController

  def ajuste
    @estoque = Estoque.new
  end

  def show
  end
end
