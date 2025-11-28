class CreateSettings < ActiveRecord::Migration[8.1]
  def change
    create_table :settings do |t|
      t.boolean :allow_sign_up, default: true
      t.boolean :default_book_requires_login, default: true

      t.timestamps
    end
  end
end
