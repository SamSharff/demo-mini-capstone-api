class CartedProductsController < ApplicationController
  
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: params[:order_id]
    )
    carted_product.save
    render json: carted_product
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render template: "carted_products/index"
  end

  def destroy
    carted_product = current_user.carted_products.find(params[:id], status: "carted")
    carted_product.status = "removed"
    carted_product.save
    render json: {status: "Product successfully removed."}
  end
end
