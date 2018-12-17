class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
# ハイライト機能
  has_many :highlighted_paragraphs

# お気に入り機能
  has_many :users_books
  has_many :likes, through: :users_books, source: :book
  has_many :reverses_of_users_books, class_name: 'Users_book', foreign_key: 'book_id'
  has_many :followers, through: :reverses_of_users_book, source: :user
  
  
  def like(other_user)
      self.users_books.find_or_create_by(book_id:other_user.id)
  end

  def dislike(other_user)
    users_book = self.users_books.find_by(book_id:other_user.id)
    users_book.destroy if users_book
  end
  
  def likes?(other_user)
    self.likes.include?(other_user)
  end



end
