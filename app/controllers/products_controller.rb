class ProductsController < ApplicationController
  before_action :except => [:index, :show] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    if params[:beer_search]
      @searched_product = Product.where('lower(name) LIKE ?', "%#{params[:beer_search].downcase}%")
    elsif params[:brand_search]
      @searched_product = Product.where('lower(brand) LIKE ?', "%#{params[:brand_search].downcase}%")
    else
      @products = Product.all.order('brand', 'name')
    end
    render :index
  end

  def new
    @product = Product.new 
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path      
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    if params[:high_rating]
      @reviews = @product.reviews.order("rating DESC")
    elsif params[:low_rating]
      @reviews = @product.reviews.order("rating ASC")
    end
    @review = Review.new
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path      
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin, :brand)
    end
end
