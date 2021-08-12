class ArtworksController < ApplicationController
    def index
        @artworks = Artwork.all
        render json: @artworks
    end

    def show
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            render json: @artwork
        else
            render json: "There is no Artwork with that id", status: 404
        end
    end

    def new
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            redirect_to artworks_url(@artwork)
        end
    end

    def edit
    end

    def update
        @artwork = Artwork.find_by(id: params[:id])
        unless @artwork
            render json: "There is no Artwork with that id", status: 404
            return
        end
        if @artwork.update(artwork_params)
            redirect_to artworks_url(@artwork)
        else
            render json: @artwork.errors.full_message
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        unless @artwork 
            return render json: "There is no Artwork with that id", status: 404
        end

        if @artwork 
            @artwork.destroy  
            redirect_to artworks_url
        else 
            render json @artwork.errors.full_message
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end