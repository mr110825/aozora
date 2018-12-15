class Author < ApplicationRecord
  # 作品用データベースとの連携
  has_many :books_authors
  has_many :books, through: :books_authors
  
end
