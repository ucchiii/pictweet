Rails.application.routes.draw do
  devise_for :users
  #httpメソッドのgetは、ウェブサイトを閲覧する時のメソッド機能
  #httpメソッドpostは、情報の登録などの際、サーバーに情報を送信するために利用
  #httpメソッドdeliteは、削除をするときのメソッド
  #httpメソッド 'パス' => 'コントローラー名#アクション名'
  root 'tweets#index'   #rootパスの指定
  # get 'tweets'          => 'tweets#index'     #ツイート一覧画面
  # get 'tweets/new'      => 'tweets#new'       #ツイート投稿画面
  # post 'tweets'         => 'tweets#create'    #ツイート投稿
  # get 'users/:id'       => 'users#show'     #Mypageへのルーティング
  # delete 'tweets/:id'   => 'tweets#destroy' #":id"で削除するツイートのidが入るようにする
  # get 'tweets/:id/edit' => 'tweets#edit'  #ツイート編集画面
  # patch 'tweets/:id'    => 'tweets#update'  #登録内容の更新
  # get 'tweets/:id'      => 'tweets#show'  #ツイート詳細が画面
  #前半部分がパス、後半部分がtweetsコントローラのnewアクションを示している
  #localhost:3000/tweets/newに行くとtweetsコントローラのnewアクションが動く

################上のルーティングをresourcesメソッドを使って書き換え###################
  resources :tweets do             #tweets_controllerに対してのresourcesメソッド
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]  #users_controllerに対してのresourcesメソッド
  #onlyオプションでアクションの指定
end
