class Product < ApplicationRecord
	include PgSearch
	pg_search_scope :quick_search, against: [:title, :description, :price, :area, :location, :category_type]

	belongs_to :user
	#serialize :photos, Array 
	#mount_uploaders :photos, PhotoUploader

	enum area: [:kepong, :petaling_jaya, :klang_valley, :subang, :shah_alam]
	enum category_type: [:vehicles, :electronics, :sports, :travel, :home, :others, :services]
end
