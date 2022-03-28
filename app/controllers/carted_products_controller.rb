class CartedProductsController < ApplicationController
  # before_action :authenticate_user
  
  def create
    carted_product = Carted_product.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status],
      order_id: params[:order_id]
    )
    if carted_product.save
      render json: { message: "Item, successfully added to cart." }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

end
