class BooksController < ApplicationController

# 一覧表示の画面
  def index
    # 登録された本の一覧を表示
    @lists = Book.all
    # 新規フォーム用の変数を定義
    @book =Book.new

  end

# create bookを押した時の処理
  def create
    #投稿フォームの情報が格納されローカル変数"book"へ引き渡す
    book = Book.new(book_params)
    # 受け取った情報をDBへ保存
    book.save
    # 詳細画面へ遷移
    redirect_to '/books/show'
  end



  def show
  end

  def edit
  end

private
  # ストロングパラメータの定義
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
