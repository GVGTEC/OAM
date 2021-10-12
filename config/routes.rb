Rails.application.routes.draw do
  resources :icms
  resources :cfop
  resources :terceiros
  resources :contas_pag
  resources :vendedores
  resources :contas_rec
  resources :plano_contas
  resources :administradores
  resources :transportadoras
  resources :localizacao_estoques

  resources :empresas do
    get "configuracoes", on: :collection
  end

  resources :orcamentos do
    resources :orcamento_itens
  end

  resources :nota_fiscais do
    get "observacoes", on: :member

    resources :gerar_nota_fiscais, only: [:gerar_nota] do
      get "gerar_nota", on: :collection
    end

    resources :nota_fiscal_itens
    resources :nota_fiscal_duplicatas, only: [:new, :create]
  end

  resources :estoques, only: [:index, :show] do
    collection do
      get "ajuste"
      get "reposicao"
      get "baixa"
      post "ajuste"
      post "reposicao"
      post "baixa"
      post "importar"
    end
  end

  resources :produtos do
    post "importar", on: :collection
    resources :movimento_estoques, only: [:index]
  end

  resources :clientes do
    post "importar", on: :collection
  end

  resources :fornecedores do
    post "importar", on: :collection
  end

  resources :importacoes do
    collection do
      get "clientes"
      get "produtos"
      get "estoques"
      get "fornecedores"
    end
  end

  root to: "home#index"

  get "/login", to: "login#index"
  post "/login", to: "login#logar"
  get "/sair", to: "login#deslogar"
end
