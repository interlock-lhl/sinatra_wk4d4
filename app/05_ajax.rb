# AJAX is REST, but communicating that information via a structured data format VS html

# http://www.sinatrarb.com/contrib/json.html

# CREATE
post '/api/products' do
  # Often we want to support posted query parameters AND JSON in the body of the post.
  # Some API's prefer or enforce one over the other. Ours supports both!
  product_hash = params # /api/products?title=Meow&sku=ACKBAR&price=1299

  # In the HTTP body we have `{"title": "Meow", "sku": "BARBAR", "price": 1233}`
  product_hash = JSON.parse(request.body.read).symbolize_keys unless product_hash[:title]

  @product = Product.new(product_hash)
  if @product.save
    json @product
  else
    status 422
    json :errors => @product.errors
  end
end

# READ
get '/api/products' do
  json Product.all
end

get '/api/products/:id' do
  json Product.find(params[:id])
end

# UPDATE
put '/api/products/:id' do

end

# DELETE
delete '/api/products/:id' do

end
