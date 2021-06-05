class UsersController < ApplicationController

  #new
  get "/users/new" do
      erb:"users/new.html"
  end
  
end
