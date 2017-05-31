class Product < ApplicationRecord
	include PgSearch
	pg_search_scope :quick_search, against: [:title, :type_of_condition, :price, :area, :location, :category_type]

	belongs_to :user
	has_many :order_items, :dependent => :destroy
	default_scope { where(active: true) }
	serialize :photos, Array 
	mount_uploaders :photos, PhotoUploader

	enum area: [:kepong, :petaling_jaya, :klang_valley, :subang, :shah_alam]
	enum category_type: [:vehicles, :electronics, :sports, :travel, :home, :others, :services]

end
