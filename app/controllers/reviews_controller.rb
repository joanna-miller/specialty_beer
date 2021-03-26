class ReviewsController < ApplicationController
  before_action :except => [:new, :create] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index 
    if params[:author_search]
      @searched_reviews = Review.where('lower(author) LIKE ?', "%#{params[:author_search].downcase}%")
    else
      @reviews = Review.all.order('author')
    end
    render :index
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path      
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end

end