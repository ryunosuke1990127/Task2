class BooksController < ApplicationController

  def index
    # 登録された本の一覧を表示
    @lists = Book.all.order(id:"ASC")
    # 新規フォーム用の変数を定義
    @book =Book.new
  end

# 　create bookを押した時の処理ifでエラーの切り分けも実施
  def create
    #投稿フォームの情報が格納されローカル変数"book"へ引き渡す
    @book = Book.new(book_params)
    # 受け取った情報が空腹でなければDBへ保存
    if @book.save
    # 内容に問題がなければフラッシュメッセージを表示しし詳細画面へリダレイクト
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
      @lists=Book.all
      render :index
    end
  end

  # 一覧画面から"Show"ボタンをクリックした時の処理
  def show
    @book = Book.find(params[:id])
  end

  #一覧画面での編集及び詳細画面からの編集機能
  def edit
    @book = Book.find(params[:id])
  end

  # 編集機能での更新機能の作成(if分でエラーの切り分けも実施)
  def update
    # 編集ページからクリックされた情報を取得
    @book=Book.find(params[:id])
    #編集ホームに入力された情報に更新
    if @book.update(book_params)
      # 内容に問題がなければフラッシュメッセージを表示しリダイレクト
    flash[:notice] = "Book was successfully updaed."
    redirect_to book_path(@book.id)
    else
    render:edit
    end
  end

  # 削除機能の追加
  def destroy
    # 一覧画面からクリックされた情報を取得
    list=Book.find(params[:id])
    list.destroy
    # 削除後は一覧画面へリダイレクト
    redirect_to books_path
  end

private
  # ストロングパラメータの定義
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
