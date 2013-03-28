DeviseTest::Application.routes.draw do

  ## 会員認証用リソース
  devise_for :users
  #         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
  #             user_session POST   /users/sign_in(.:format)       devise/sessions#create
  #     destroy_user_session GET    /users/sign_out(.:format)      devise/sessions#destroy
  #            user_password POST   /users/password(.:format)      devise/passwords#create
  #        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
  #       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
  #                          PUT    /users/password(.:format)      devise/passwords#update
  # cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
  #        user_registration POST   /users(.:format)               devise/registrations#create
  #    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  #   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
  #                          PUT    /users(.:format)               devise/registrations#update
  #                          DELETE /users(.:format)               devise/registrations#destroy
  
  
  ## card情報一覧
  # resources :cards
  get '/cards(.:format)', :to => 'cards#index'
  post '/cards(.:format)', :to => 'cards#create'
  #  new_card GET    /cards/new(.:format)      cards#new
  # edit_card GET    /cards/:id/edit(.:format) cards#edit
  #      card GET    /cards/:id(.:format)      cards#show
  #           PUT    /cards/:id(.:format)      cards#update
  #           DELETE /cards/:id(.:format)      cards#destroy
  
  
  ## ユーザー一覧
  resources :users
  #     users GET    /users(.:format)          users#index
  #           POST   /users(.:format)          users#create
  #  new_user GET    /users/new(.:format)      users#new
  # edit_user GET    /users/:id/edit(.:format) users#edit
  #      user GET    /users/:id(.:format)      users#show
  #           PUT    /users/:id(.:format)      users#update
  #           DELETE /users/:id(.:format)      users#destroy
  
  
  ## ログインしてないユーザーの入り口
  root :to => 'welcome#index'
  
  ## ログイン後ユーザーの入り口
  get 'mycards',      :to => 'home#index', :as => :user_root
  get 'active_cards', :to => 'home#active_cards'
end
