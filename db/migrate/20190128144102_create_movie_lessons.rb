# migrationファイルを作るときは、ターミナル上で「rails g model migrationファイル名」
# すると、プロジェクトのdbディレクトリのmigrateにmigrationファイルが作成される
# そのとき名前は「日時_create_指定したファイル名s」になる
# ※指定したファイル名s = テーブル名になる

# その後、マイグレーションファイル（このファイル）に「t.型 :◯◯」という形でカラムを追加し、
# ファイルを保存（この状態ではまだテーブルは作成されていない）
# それから、rake db:migrateを実行し、テーブルを作成する
# 追加削除は一つ一つやらないといけないのでなるべく最初に必要なカラムは作成しておく

# カラムの追加
# ターミナルで「rails g migration 任意の名前」で、カラムを追加するためのマイグレーションファイルを作成する
# ※任意の名前はAdd追加したいカラム名Toテーブル名
# 続きは「20190128150701_add_image_to_movie_lesson」へ

# カラムの削除
# ターミナルで「rails g migration 任意の名前」で、カラムを追加するためのマイグレーションファイルを作成する
# ※任意の名前はRemove削除したいカラム名Toテーブル名
# 続きは「20190128150701_Remove_users_to_movie_lesson」へ

# ロールバック
# 追加削除するマイグレーションファイルを上記の手順で作り、
# そのマイグレーションファイルを編集し、追加削除する処理を記入し、
# 「rake db:migrate」した後に、間違えたと築いた場合は、
# 「rake db:rollback」とターミナルに打ち込み
# マイグレートされる前の状態に戻すことができる



class CreateMovieLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_lessons do |t|
      t.text :bodys
      t.timestamps
    end
  end
end
