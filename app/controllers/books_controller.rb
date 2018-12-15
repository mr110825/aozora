class BooksController < ApplicationController
  def index
    # 検索オブジェクト
    @search = Book.ransack(params[:q])
    # 検索結果
    @books = @search.result
  end

  def show
    @book = Book.find(params[:id])
  end


end
