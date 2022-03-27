class Product < ApplicationRecord
  has_many :orders
  belongs_to :supplier
  has_many :images
  has_many :category_products
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }
  # validates :description, presence: true
  # validates :description, length: { in: 10..500 }

  has_many :categories, through: :category_products
  
  # def categories
  #   category_products.map do |category_product|
  #     category_product.category
  #   end
  # end
  
  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
