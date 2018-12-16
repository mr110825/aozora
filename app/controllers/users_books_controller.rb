class UsersBooksController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    user = User.find(params[:user_id])
    user.like(book)
    flash[:success] = 'お気に入りを追加しました。'
    redirect_to :back
  end

  def destroy
    @book = Book.find(params[:book_id])
    user.dislike(@book)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to :back
  end

end
