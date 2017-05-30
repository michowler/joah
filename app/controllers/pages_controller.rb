class PagesController < ApplicationController
	def index
		#@products = Product.quick_search(params[:search])
		@products = Product.all.paginate(:page => params[:page], :per_page => 6).order('id DESC')
		#@products = Product.quick_search(params[:search])
	end
end
