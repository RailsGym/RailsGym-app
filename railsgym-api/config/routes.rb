Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  # ブラウザ上でGraphQL APIを動かして動作を確認できる http://localhost:8080/graphiql → gem 'graphiql-rails'
  # APIモードだとerrorが発生したので右記の記事にて対応 → https://qiita.com/dkawabata/items/4fd965ee6d7295386a8b#%E8%BF%BD%E8%A8%98
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  post "/graphql", to: "graphql#execute"

  namespace :api do
    namespace :v1 do
      get 'me', to: 'me#show'
    end
  end
end
