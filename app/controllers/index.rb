require 'bcrypt'
require 'pry'
get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create' do
  erb :create
end

post '/create' do
  @user = User.create(email: params["email"], password: params["password"])
  erb :index
end

post '/signin' do
  if User.authenticate(params["email"], params["password"]) == nil
    "User/password combination does not exist"
  else
    erb :secret
  end
end
