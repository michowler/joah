class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :full_name, null: false
    	t.string :email, unique: true, null: false
      t.string :contact
    	t.string :password
    	t.string :password_digest
      
     	t.timestamps
    end
	    add_index :users, :full_name
	    add_index :users, :email
  end
end
