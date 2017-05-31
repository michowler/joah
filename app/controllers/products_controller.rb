class ProductsController < ApplicationController
	#before_action :logged_in_user, only: [:new, :create]
	before_action :require_login, only: [:new, :create]
	before_action :find_product, only: [:show, :delete, :edit, :update]
	#respond_to :html, :js
	#https://launchschool.com/blog/the-detailed-guide-on-how-ajax-works-with-ruby-on-rails

	def index
	    @products = Product.all
	    @products = Product.quick_search(params[:search]).paginate(:page => params[:page], :per_page => 6).order('id DESC')
	     
	end
	
	def new
		@product = Product.new
	end

	def create
		@product = current_user.products.new(product_params)
		#@product.tag_ids = product.new(tag_ids: params[:product][:tag_ids])
		# @product.user_id = current_user.id
		if @product.save
			redirect_to @product
		else

			redirect_to @product, notice: "Sorry. product not saved."
		end	
	end

	def update
       @product.update(product_params)
       @product.user_id = current_user.id
       redirect_to @product
	end

	def edit
	end	

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to @product
	end

	def show
		@products = Product.find(params[:id])
		@order = current_order
		@order_item = @order.order_items.new
		@order.save
		session[:order_id] = @order.id
		
	end

	private 
	def find_product
		@product = Product.find(params[:id])
	end

	def product_params
	    params.require(:product).permit(:title, :description, :location, :category_type, :area, :price, {:photos => []})
	end

	def require_login
	  unless current_user
	    flash[:danger] = "You must be logged in to access this section"
	    redirect_to sign_in_path # halts request cycle
	  end
	end
end
