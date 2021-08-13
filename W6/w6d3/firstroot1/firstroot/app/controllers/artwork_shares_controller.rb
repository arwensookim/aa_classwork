class ArtworkSharesController < ApplicationController
    def index
        @artwork_shares = ArtworkShare.all
        render json: @artwork_shares
    end

    def show
        @artwork_share = ArtworkShare.find_by(id: params[:id])
        if @artwork_share
            render json: @artwork_share
        else
            render json: "There is no ArtworkShare with that id", status: 404
        end
    end

    def new
    end

    def create
        @artwork_share = ArtworkShare.new(artwork_params)
        if !User.find_by(id: params[:viewer_id]) || !Artwork.find_by(id: params[:artwork_id])
            return render json: "either user or artwork does not exist"
        end
        if @artwork_share.save
            redirect_to artworks_url(@artwork_share)
        else
            render json: "this artwork is arleady shared with viewer"
        end
    end

    def edit
    end

    def update
        @artwork_share = ArtworkShare.find_by(id: params[:id])
        unless @artwork_share
            render json: "There is no ArtworkShare with that id", status: 404
            return
        end
        if @artwork_share.update(artwork_params)
            redirect_to artworks_url(@artwork_share)
        else
            render json: @artwork_share.errors.full_message
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find_by(id: params[:id])
        unless @artwork_share 
            return render json: "There is no ArtworkShare with that id", status: 404
        end

        if @artwork_share 
            @artwork_share.destroy  
            redirect_to artworks_url
        else 
            render json @artwork_share.errors.full_message
        end
    end

    private
    def artwork_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end