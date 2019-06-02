#'TweetsController'はコントローラにおけるクラス
#このファイルは「tweets」コントローラの「index」アクションのビュー
class TweetsController < ApplicationController #クラスの継承

  before_action :move_to_index, except: [:index, :show]
  # before_actionメソッドは、アクションを行う前に処理を行う
  # move_to_indexメソッドは、ユーザーがサインインしていないと、指定したアクションにリダイレクトさせるというもの。
  # 上記の場合、アクションを行う前に、ユーザーがログインしていないと、indexアクションとshowアクションにリダイレクトされる



  #アクションとはコントローラに存在するインスタンスメソッド
  #'index'は、アクションでコントローラーにあるインスタンスメソッドでもある
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  # def create
  #   #createアクションが動いた際にtweetsテーブルに新たなレコードが保存
  #   #ハッシュparamsのキー[:◯◯]をtweetsテーブルに追加
  #   Tweet.create(name: params[:name] image: params[:imge], text: params[:test])
  # end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    #createアクションが動いた際にtweetsテーブルに新たなレコードが保存
    #tweet_paramsは、ストロングパラメーター名
    #tweetsテーブルにレコードを作成するcreateメソッドの引数が(tweet_params)となっているので、tweet_paramsメソッドが呼び出される
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id
  end

  def show
    @tweet = Tweet.find(params[:id])
    # Tweetのidのレコードを抽出
    # viewから送られてくるparamsから情報を取り出しfindメソッドの引数とする
    @comments = @tweet.comments.includes(:user)
    # tweetsテーブルとcommentsテーブルはアソシエーションが組まれているので、
    # @tweet.commentsとすることで、@tweetについて投稿された全てのコメントのレコードを取得（Tweet has many comments）
    #includesメソッドを使って、N + 1問題を解決
  end


  private #classの外部から呼び出せなくなる
  def tweet_params
    params.permit(:image, :text,)
    #ビューから送られてきた情報のハッシュであるparamsの中から:name, :image, :textというキーとそのバリューのセットだけを残した新たなハッシュを生成
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    # 上と同義下
    # unless user_signed_in?        ユーザーがログインしていないとき
    #  redirect_to action: :index indexアクションを強制実行
    # end
  end


end
