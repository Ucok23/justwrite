class AddRequiresLoginToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :requires_login, :boolean
  end
end
