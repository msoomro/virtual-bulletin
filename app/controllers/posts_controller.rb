class PostsController < ApplicationController

    # create
    post "/boards/:board_id/posts" do
        @board = Board.find(params[:board_id])
        @post = @board.posts.new(params[:post])
        @post.user_id = current_user.id
        @post.save
        redirect "/boards/#{@board.id}"
    end

end
