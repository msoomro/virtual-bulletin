class UsersController < ApplicationController
  # index
  get "/users" do
    @users = User.all
    erb :"users/index.html"
  end

  # new
  get "/users/new" do
    erb:"users/new.html"
  end
  
  # create
  post "/users" do
    user = User.create(params)
    session[:user_id] = user.id
    redirect "/"
  end

end
