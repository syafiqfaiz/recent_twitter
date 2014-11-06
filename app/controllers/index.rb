get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/:username' do
  user = User.find_or_create(params[:username])
  @tweets = user.get_10_tweets

  erb :'/tweets/show_all'
end