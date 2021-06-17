class UsersController < ApplicationController
  # index
  get "/users" do
    @users = User.all
    erb :"users/index.html"
  end

  # new
  get "/users/new" do
    erb :"users/new.html"
  end
  
  #show
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show.html"
  end

  get "/profile" do
    redirect "/users/#{current_user.id}"
  end
  
  # create
  post "/users" do
    user = User.create(params)
    if user.valid?
      session[:user_id] = user.id
      redirect "/"
    else
      # handle errors
      flash[:errors] = user.errors.full_messages
      redirect "/users/new"
    end
   end

end
