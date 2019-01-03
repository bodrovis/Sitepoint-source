class ProductsController < ApplicationController
  def index
    @products = Product.all_cached
  end

  def show
    @product = Product.find(params[:id])
    # if stale?(last_modified: @product.updated_at.utc, etag: @product.cache_key)
    #   respond_to do |format|
    #     format.html
    #   end
    # end

    fresh_when @product
  end
end