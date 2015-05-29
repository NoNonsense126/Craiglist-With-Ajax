#index
# get '/categories' do
# end

#new
get '/categories/new' do
  @category = Category.new
  erb :'categories/new'
end

post '/categories' do
  @category = Category.new(params[:category])
  if @category.save
    redirect to "/categories/#{@category.id}"
  else
    erb :"categories/new"
  end
end

#show
get '/categories/:id' do
  @category = Category.find(params[:id])
  @posts = @category.posts
  erb :'categories/show'
end

#edit
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb :'categories/edit'
end

#update
put '/categories/:id' do
  @category = Category.find(params[:id])
  @category.update(params[:category])
  redirect to "/categories/#{@category.id}"
end

#delete
delete '/categories/:id' do
  @category = Category.find(params[:id])
  @category.destroy
  redirect to "/"
end
