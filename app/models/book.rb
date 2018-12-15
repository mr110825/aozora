class Book < ApplicationRecord
  
# お気に入り機能
    has_many :users, through: :users_books
    has_many :users_books

  
# 著者用データベースとの連携
  has_many :books_authors
  has_many :authors, through: :books_authors



end
