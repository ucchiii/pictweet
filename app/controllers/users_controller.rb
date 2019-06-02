class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
    #current_user.tweetsでログイン中のユーザーのテーブルのカラム名取得
    #kaminari:pageメソッドでページ数を指定
    #kaminari:perメソッドで1ページで表示する件数を指定
    #order("created_at DESC")でカラム名created_atの降順
    #書き直した→whereメソッドの引数を(カラム名: そのカラムの値)
    # アソシエーションを利用することで、そのユーザーが投稿したツイートを取得して、@tweetsに代入
  end

end
