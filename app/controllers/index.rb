get "/" do
 erb :wat
end

get "/signup" do

  erb :signup
end

post "/signup" do
  user = User.create(username: params[:username], password: params[:password])
  session[:user_id] = user.id
  redirect('/welcome')
end

get "/welcome" do
  erb :welcome
end

get "/about" do
  erb :about
end

get "/login" do
  erb :login
end

post "/login" do
  user = User.find_by(username: params[:username])
  if user.password == params[:password]
    session[:user_id] = user.id
    status 200
    return erb :wats, layout: true
  else
    status 422
    return "Incorrect"
  end
end

get "/wats" do
  @user = current_user
  @received = @user.received_wats
  @sent = @user.sent_wats
  erb :wats
end

post "/wats" do

end
