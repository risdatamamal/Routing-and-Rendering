require 'sinatra'
set :protection, :except => :frame_options
require_relative 'config'

get '/' do
  "Hello name: #{params[username]}"
end

# New Items
get '/items/new' do 
  erb :new_items
end

# Items 
get '/items' do
  erb :items, locals: {
    name: params[:name], 
    category: params[:category], 
    price: params[:price]
  }
end

post '/items' do
  if params['name'] != '' && params['category'] != '' && params['price'] != ''
    redirect '/items'
  else
    redirect '/items/new'
  end
end

get '/login' do 
  erb :login
end

post '/login' do
  if params['username'] == 'admin' && params['password'] == 'admin'
    redirect '/'
  else
    redirect '/login'
  end
end