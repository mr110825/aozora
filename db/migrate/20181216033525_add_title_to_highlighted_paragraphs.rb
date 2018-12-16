class AddTitleToHighlightedParagraphs < ActiveRecord::Migration[5.0]
  def change
    add_reference :highlighted_paragraphs, :book, foreign_key: true
  end
end
