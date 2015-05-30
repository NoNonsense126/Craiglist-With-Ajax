#new
get '/categories/:category_id/posts/new' do
  @category = Category.find(params[:category_id])
  @post = @category.posts.new
  erb :'posts/new'
end

#create
post '/categories/:category_id/posts' do
  @category = Category.find(params[:category_id])
  # @post = Post.new(params[:post])
  # @post.category_id = @category.id
  @post = @category.posts.build(params[:post])
  if @post.save
    @post.to_json
  else
    {result: "failed"}.to_json
  end

end

#show
get '/posts/:id' do
  @post = Post.find(params[:id])
  @category = @post.category
  erb :"/posts/show"
end

#edit
get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :"/posts/edit"
end

#update
put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update(params[:post])
  if @post.save
    redirect to "/posts/#{@post.id}"
  else
    erb :"posts/edit"
  end
end

#delete
delete '/posts/:id' do
    
end
