# REST = representational state transfer
# Imagine the state of your app, described with data, is on the server. How do we communicate that state
# to our web application?

# Much like our ORM that supported CRUD/BREAD, we can create some http paths that enable us to access this data

# CREATE, the form to post
get '/products/new' do
  erb :"products/new"
end

# CREATE, where we POST to and create the resource
post '/products' do
  @product = Product.new(params[:product])
  if @product.save
    redirect '/products'
  else
    erb :"products/new"
  end
end

# READ a collection of resources
get '/products' do
  @products = Product.all
  erb :"products/index"
end

# READ a single product, referenced by id
get '/products/:id' do
  # TODO what happens if :id doesn't exist in our database?
  @product = Product.find(params[:id])
  erb :"products/view"
end

# UPDATE form that we PUT
get '/products/:id/edit' do
  @product = Product.find(params[:id])
  erb :"products/edit"
end

# NOTE sometimes we use PUT here, or both!
post '/products/:id' do
  @product = Product.find(params[:id])
  if @product.update(params[:product])
    redirect '/products'
  else
    erb :"products/edit"
  end
end

# HTTP supports the DELETE method, but why are we using POST?
# TODO look into `use Rack::MethodOverride` as a solution?
post '/products/:id/delete' do
  @product = Product.find(params[:id])
  # TODO what if we fail to delete the product?
  @product.destroy
  redirect '/products'
end
