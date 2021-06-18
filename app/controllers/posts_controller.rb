class PostsController < ApplicationController

    # create
    post "/boards/:board_id/posts" do
        if logged_in?
            @board = Board.find(params[:board_id])
            @post = @board.posts.new(params[:post])
            @post.user_id = current_user.id
            if @post.save
                redirect "/boards/#{@board.id}"
            else
                flash[:errors] = @post.errors.full_messages
                redirect "/boards/#{@board.id}"
            end
        else
            redirect_if_not_logged_in
        end
    end

    # edit
    get "/boards/:board_id/posts/:id/edit" do
        redirect_if_not_logged_in
        @board = Board.find(params[:board_id])
        @post = @board.posts.find(params[:id])
        if @post.user == current_user
            erb :"posts/edit.html"
        else
            redirect "/boards/#{@board.id}"
        end
    end

    # patch
    patch "/boards/:board_id/posts/:id" do
        board = Board.find(params[:board_id])
        post = board.posts.find(params[:id])
        if post.user == current_user
            if post.update_attributes(params[:post])
                redirect "/boards/#{board.id}"
            else
                flash[:errors] = post.errors.full_messages
                redirect "/boards/#{board.id}/posts/#{post.id}/edit"
            end
        end
    end

    # delete
    delete "/boards/:board_id/posts/:id" do
        board = Board.find(params[:board_id])
        post = board.posts.find(params[:id])
        if post.user == current_user
            post.destroy
            redirect "/boards/#{board.id}"
        end
    end

end
