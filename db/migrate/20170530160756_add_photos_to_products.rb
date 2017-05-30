class AddPhotosToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :photos, :json
  end
end
