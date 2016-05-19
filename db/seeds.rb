# If we are in development, seed us some fake data!
if settings.environment.to_s == 'development'
  Product.create!(title: "Moose Ears", sku: "MOOOOSE", price: 799)
else
  # Production data could go here

end

# Both dev and production
