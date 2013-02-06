DeviseTest::Application.routes.draw do
  
  # ログインしてないユーザーの入り口
  root :to => 'welcome#index'
  
  # ログイン後ユーザーの入り口
  get 'home', :to => 'home#index', :as => :user_root
  

  # 会員認証用リソース
  devise_for :users
  
  # devise_scope :user do
  #   # destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
  #   # デフォルトのログアウト用ルートの↑これがJavaScript使わなきゃアクセス出来ないので、getでログアウト出来るrouteを用意
  #   # これに合わせて devise.rbを修正してる
  #     # before: config.sign_out_via = :delete
  #     # after: config.sign_out_via = :get
  #   # get '/sign_in'   => 'devise/sessions#new'
  #   # get '/sign_out'  => 'devise/sessions#destroy'
  #   # get '/sign_up'   => 'devise/registrations#new'
  # end

  # card情報一覧
  # ログインが必須の為、before_filterをかける
  resources :cards
  resources :users
end
