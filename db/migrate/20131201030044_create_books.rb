class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, :null => false
      t.string :ISBN, :null => false

      t.timestamps
    end
    
    add_index(:books, :title)
    add_index(:books, :ISBN)
    
  end
end
