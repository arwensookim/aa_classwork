class CatsController < ApplicationController 
    
    def index 
        @cats = Cat.all 
        render :index
    end 
    
    def show 
        @cat = Cat.find_by(id: params[:id])
        if @cat 
            render :show 
        else  
            render plain: "No cat with that ID"
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def edit 
        @cat = Cat.find_by(id: params[:id])
        render :edit 
    end 

    private

    def cat_params 
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :descrition)
    end 
end 