class UsersController < ApplicationController
    def index
        @users = User.all

        if user_params[:query]
           query = user_params[:query].split(" ")
           return render json: "Incorrect SQL syntax" if query.first.downcase != 'like' && query.first.downcase != 'similar'    
            
            (query[1].downcase == 'to')? to = ' TO': to = ''
            
            comparison_string = "username #{query.first.upcase}#{to} #{query.last}" 
            render json: @users.where(comparison_string)
        else  
            render json: @users
        end 
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render json: @user
        else
            render json: "There is no user with that id", status: 404
        end
    end

    def new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_url(@user)
        end
    end

    def edit
    end

    def update
        @user = User.find_by(id: params[:id])
        unless @user
            render json: "There is no user with that id", status: 404
            return
        end
        if @user.update(user_params)
            redirect_to users_url(@user)
        else
            render json: @user.errors.full_message
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        unless @user 
            return render json: "There is no user with that id", status: 404
        end

        if @user 
            @user.destroy  
            redirect_to users_url
        else 
            render json @user.errors.full_message
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :query)
    end
end