class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :address_cont
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false

      t.timestamps
    end
    
    add_index(:libraries, :name)
    
  end
end
