# changeメソッドの中に追加するカラム名を記載していく
# 追加の仕方は、add_column :テーブル名, :カラム名, :型
# 記載した後ターミナルで、「rake db:migrate」
# テーブルにカラムが追加されたことを確認する
# エラーが原因：ファイル名を変更した

class AddImageToMovieLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_lessons, :image, :text
  end
end
