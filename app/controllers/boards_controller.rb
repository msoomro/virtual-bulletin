class BoardsController < ApplicationController

    #index
    get "/boards" do
        @boards = Board.all
        erb :"boards/index.html"
    end

end
