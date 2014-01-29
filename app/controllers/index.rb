require 'bcrypt'
require 'pry'
enable :sessions
get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create' do
  erb :create
end

post '/create' do
  @user = User.create(email: params["email"], password: params["password"]) # password is not in the table,
                                                                            # but it should be this way in order to use bcrypt.
                                                                            # Leave like that
  erb :index
end

post '/signin' do
  if User.authenticate(params["email"], params["password"]) == nil
    "User/password combination does not exist"
  else
    session[:email] = params["email"]
    redirect '/secret'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/secret' do
  if session[:email] != nil
    erb :secret
  else
    'You are not logged in'
  end
end
