Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  # rootをroomのindexへ指定。
  get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "messages#index"
  # 上記はトップページである、root indexへ移行するよう修正したため削除
  resources :users, only: [:edit, :update]
  # これによって/usersのパスに対応するルーティングが生成される、なお、onlyによって生成するルーティングを制限している
  # editは編集、updateは更新を表している。
  resources :rooms, only: [:new, :create]
  # 新規チャットルームの作成で動くアクションはnewとcreateのみなので、このコードになる

end
