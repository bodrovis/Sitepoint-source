class ProductsController < ApplicationController
  def index
    @products = Product.order('created_at DESC')
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_products.xlsx"'
      }
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end