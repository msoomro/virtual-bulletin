class BoardsController < ApplicationController

    #new
    get "/boards/new" do
        erb :"boards/new.html"
    end
    
    #create
    post "/boards" do
        @board = current_user.boards.create(params[:board])
        redirect "/boards/#{@board.id}"
    end
    
    #index
    get "/boards" do
        @boards = Board.all
        erb :"boards/index.html"
    end

    #show
    get "/boards/:id" do
        @board = Board.find(params[:id])
        erb :"/boards/show.html"
    end

end
