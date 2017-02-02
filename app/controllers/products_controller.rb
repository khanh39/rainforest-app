class ProductsController < ApplicationController

  def index
    @products = Product.all
  end
  #
  def show
    @product = Product.find(params[:id])

    if current_user
        @review = @product.reviews.build
      end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new

  end
  #
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to product_url(@product)
    else
      render :edit
    end
  end

  # def delete
  #   @product = Product.find(params[:id])
  #   @product.destroy
  #   redirect_to pictures_url
  # end
  #
  # def edit
  #   @product = Product.find(params[:id])
  # end

  def product_params
        params.require(:product).permit(:name, :description, :price_in_cents)
  end


end
