get '/post/view/:id' do
  @post = Post.find(params[:id])

  erb :post
end

get '/post/new' do
  p params
  erb :create_post
end

post '/post/new' do
  user = User.find(session[:id])
  @post = Post.create(params)
  
  user.posts << @post
  user.save

  if @post.valid?
    redirect "/post/view/#{@post.id}"
  else
    erb :create_post
  end
end

post '/comment/:id' do
  if session[:id]
    comment = Comment.create(content: params[:content])
    
    user = User.find(session[:id])
    post = Post.find(params[:id])
    
    post.comments << comment
    user.comments << comment
    
    post.save
    user.save
    
    redirect "/post/view/#{params[:id]}"
  else
    @error  = "Please log in or sign up to comment."
    @post   = Post.find(params[:id])

    erb :post
  end
end

