class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
		t.references :user, foreign_key: true
		t.string :title, null: false
		t.string :description	
		t.integer :area
		t.integer :category_type
		t.integer :price, null: false
		t.string :location
		t.timestamps
    end
	    add_index :products, :title
	    add_index :products, :category_type
	    add_index :products, :area
	    add_index :products, :description
	    add_index :products, :location
	    add_index :products, :price
  end
end
