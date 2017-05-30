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
		t.boolean :active
		t.timestamps
    end
	    add_index :products, :title
  end
end
