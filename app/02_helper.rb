helpers do

  # products_path, given a product gives us a string path to that product
  def products_path(product)
    "/products/#{product.id}"
  end

  # format_price, take our cents price and make it pretty
  # http://ruby-doc.org/core-2.3.1/Kernel.html#method-i-sprintf
  def format_price(price)
    sprintf("%.2f", price / 100.0)
  end
end
