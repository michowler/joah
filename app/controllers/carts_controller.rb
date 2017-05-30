class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items.paginate(:page => params[:page], :per_page => 3).order('id DESC')
  end

  def destroy
  	@order_items.destroy
  	redirect_to root_path
  end
end
