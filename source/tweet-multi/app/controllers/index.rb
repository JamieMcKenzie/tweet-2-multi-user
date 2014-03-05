get '/' do
  erb :index
end

get '/sign_in' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/auth' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  session.delete(:request_token)

  # at this point in the code is where you'll need to create your user account and store the access token


  # -------------------------------------------------------------------------------
  # ToDo (from Release 1):
  # Create the new user, set her as "logged in"
  # and store her access token and secret along with her user record.

  p @access_token

  new_user = User.create(username: @access_token.params[:screen_name], oauth_token: @access_token.params[:oauth_token] , oauth_secret: @access_token.params[:oauth_token_secret] )
  p new_user




  # -------------------------------------------------------------------------------
  erb :index
end
