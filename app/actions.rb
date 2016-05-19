require_relative './01_rest'
require_relative './02_helper'
require_relative './03_partials'
require_relative './04_nested'
require_relative './05_ajax'

# Homepage (Root path)
get '/' do
  erb :index
end

get '/spa' do
  erb :spa
end
