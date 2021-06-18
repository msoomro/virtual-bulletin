class BoardsController < ApplicationController

    #new
    get "/boards/new" do
        redirect_if_not_logged_in
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
        redirect_if_not_logged_in
        @board = Board.find(params[:id])
        erb :"/boards/show.html"
    end

    #edit
    get "/boards/:id/edit" do
        redirect_if_not_logged_in
        @board = Board.find(params[:id])
        if @board.user == current_user
            erb :"boards/edit.html"
        else
            redirect "/boards/#{@board.id}"
        end
    end

    #patch
    patch "/boards/:id" do
        board = Board.find(params[:id])
        if board.user == current_user
            if board.update(params[:board])
                redirect "/boards/#{board.id}"
            else
                flash[:errors] = board.errors.full_messages
                redirect "/boards/#{board.id}/edit"
            end
        end
    end

    #delete
    delete "/boards/:id" do
        board = Board.find(params[:id])
        if board.user == current_user
            board.destroy
            redirect "/users/#{current_user.id}"
        end
    end

end
