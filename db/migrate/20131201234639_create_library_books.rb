class CreateLibraryBooks < ActiveRecord::Migration
  def change
    create_table :library_books do |t|
      t.references :library
      t.references :book
      t.integer :request_count

      t.timestamps
    end
  end
end
