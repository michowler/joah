class AddAvatarToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :avatars, :json
  end
end
