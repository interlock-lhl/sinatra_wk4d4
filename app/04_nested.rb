# Nested resources often represents a has_one or has_many relationship

# If a product has many reviews, we may do something like this

get '/products/:id/reviews' do
  @product = Product.find(params[:id])
  @reviews = @product.reviews
  erb :product_reviews
end

post '/products/:id/reviews' do
  @product = Product.find(params[:id])
  review = Review.new(params[:review])
  review.product = @product
  # TODO flash!
  # TODO error check!
  review.save
  redirect product_path(@product) + "/reviews"

end
