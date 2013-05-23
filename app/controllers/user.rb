get '/user/signup' do

  erb :signup
end

get '/user/login' do
  
  erb :login 
end

get '/user/logout' do
  session.clear

  redirect '/'
end

post '/user/login' do
  @user = User.authenticate(params)
  if @user
    session[:id] = @user.id
    redirect '/'
  else
    @error = "Invalid username or password."
    erb :login
  end
end

post '/user/signup' do
  @user = User.create(params)
  
  redirect '/'
end

get '/user/profile/:username' do |username|
  @user = User.find_by_username(username)
  
  erb :profile
end
