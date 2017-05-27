class Product < ApplicationRecord
	belongs_to :user
	#serialize :photos, Array 
	#mount_uploaders :photos, PhotoUploader

	enum area: [:kepong, :petaling_jaya, :klang_valley, :subang, :shah_alam]
	enum category_type: [:vehicles, :electronics, :sports, :travel, :home, :others, :services]
end
