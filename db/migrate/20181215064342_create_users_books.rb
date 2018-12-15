class CreateUsersBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :users_books do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
