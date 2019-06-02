class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    #クラスに対してcreateメソッドを使ってインスタンスを作成し、データベースに保存
    # redirect_to "/tweets/#{@comment.tweet.id}"   #コメントと結びつくツイートの詳細画面に遷移する
    # アソシエーションを使って、@commentと結びつくツイートのidを記述
    respond_to do |format|
      format.html{redirect_to tweet_path(params[:tweet_id])}
      format.json
    end
  end

  private
  def comment_params
    params.permit(:text, :tweet_id)
  end
end
