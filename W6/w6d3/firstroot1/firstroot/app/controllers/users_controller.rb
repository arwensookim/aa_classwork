class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
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
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end