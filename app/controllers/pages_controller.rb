class PagesController < ApplicationController
	def index
		@products = Product.all.paginate(:page => params[:page], :per_page => 6).order('id DESC')
	end
end
