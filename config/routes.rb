# config/routes.rb

Rails.application.routes.draw do
  # Define o namespace principal da API
  namespace :api do
    # Define o namespace da versão 1 da API
    namespace :v1 do
      # Rota para login (autenticação)
      post '/login', to: 'auth#login'

      # Rotas para usuários (sign-up, perfil, etc.)
      resources :users

      resources :home
      resources :animals
      resources :organizations
      
      # Outros recursos, como adoções, mensagens, etc., virão aqui
    end
  end
end