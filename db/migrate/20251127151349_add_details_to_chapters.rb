class AddDetailsToChapters < ActiveRecord::Migration[8.1]
  def change
    add_column :chapters, :position, :integer
    add_column :chapters, :status, :string
    add_column :chapters, :notes, :text
    add_column :chapters, :word_count, :integer
  end
end
