class CartedProductsController < ApplicationController
  
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
      # order_id: params[:order_id]
    )
    carted_product.save
    render json: carted_product
    #   render json: { message: "Item, successfully added to cart." }, status: :created
    # else
    #   render json: { errors: user.errors.full_messages }, status: :bad_request
    # end
  end

end
