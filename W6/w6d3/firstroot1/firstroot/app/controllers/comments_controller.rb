class CommentsController < ApplicationController

    def index 
        @user = User.find_by(id: comment_params[:user_id]) 
        @art = Artwork.find_by(id: comment_params[:artwork_id]) 

        return render json: "There is no user or artwork with that id", status: 404 if !@user && !@art 

        if @user && @art 
            @user_comments = @user.comments.joins(:artwork).
                where('artworks.id = ?', @art.id)
            render json: @user_comments
        elsif @user 
            render json: @user.comments 
        else 
            render json: @art.comments 
        end 

    end

    def create
    end

    def destroy
    end

    private 

    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id)
    end
end