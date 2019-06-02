# changeメソッドの中に追加するカラム名を記載していく
# 追加の仕方は、remove_column :テーブル名, :カラム名, :型
# 記載した後ターミナルで、「rake db:migrate」
# テーブルにカラムが削除されたことを確認する
# エラーが原因：ファイル名を変更した

class RemoveUsersToMovieLesson < ActiveRecord::Migration[5.2]
  def change
    remove_column :movie_lessons, :users, :string
  end
end
