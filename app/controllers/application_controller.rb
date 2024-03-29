require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
  end

  get "/" do
    redirect "/boards"
  end

  helpers do

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        logged_in? && User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      redirect "/login" if !current_user
    end

  end

end
