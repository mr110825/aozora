class Book < ApplicationRecord
# 著者用データベースとの連携
  has_many :authors, through: :books_authors
  has_many :books_authors

# ハイライトデータベースとの連携
  has_many :highlighted_paragraphs
  
# カテゴリーデータベースとの連携
  belongs_to :category
  
# お気に入り機能
  has_many :users, through: :users_books
  has_many :users_books
end
