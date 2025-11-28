class AddPublishedToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :published, :boolean
  end
end
