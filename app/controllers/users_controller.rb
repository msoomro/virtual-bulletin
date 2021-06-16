class UsersController < ApplicationController
  # index
  get "/users" do
    @users = User.all
    erb :"users/index.html"
  end

  #show
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show.html"
  end

  get "/profile" do
    redirect "/users/#{current_user.id}"
  end

  # new
  get "/users/new" do
    erb :"users/new.html"
  end
  
  # create
  post "/users" do
    user = User.create(params)
    session[:user_id] = user.id
    redirect "/"
  end

end
