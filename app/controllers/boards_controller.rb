class BoardsController < ApplicationController

    #index
    get "/boards" do
        @boards = Board.all
        erb :"boards/index.html"
    end

    get "/boards/:id" do
        @board = Board.find(params[:id])
        erb :"/boards/show.html"
    end

end
