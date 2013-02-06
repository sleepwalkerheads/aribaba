DeviseTest::Application.routes.draw do

  # 会員認証用リソース
  devise_for :users

  # card情報一覧
  # ログインが必須の為、before_filterをかける
  resources :cards
  resources :users  
    
  # ログインしてないユーザーの入り口
  root :to => 'welcome#index'
  
  # ログイン後ユーザーの入り口
  get 'mycards',      :to => 'home#index', :as => :user_root
  get 'active_cards', :to => 'home#active_cards'
end
