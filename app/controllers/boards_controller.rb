class BoardsController < ApplicationController

    #new
    get "/boards/new" do
        erb :"boards/new.html"
    end
    
    #create
    post "/boards" do
        @board = current_user.boards.create(params[:board])
        if @board.valid?
            redirect "/boards/#{@board.id}"
        else
            flash[:errors] = @board.errors.full_messages
            redirect "/boards/new"
        end
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

    #edit
    get "/boards/:id/edit" do
        @board = Board.find(params[:id])
        erb :"boards/edit.html"
    end

    #patch
    patch "/boards/:id" do
        board = Board.find(params[:id])
        if board.update(params[:board])
            redirect "/boards/#{board.id}"
        else
            flash[:errors] = board.errors.full_messages
            redirect "/boards/#{board.id}/edit"
        end
    end

    #delete
    delete "/boards/:id" do
        board = Board.find(params[:id])
        board.destroy
        redirect "/boards"
    end

end
