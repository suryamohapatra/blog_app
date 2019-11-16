class UsersController < ApplicationController
    def index
        User.all
    end
    def new
        @user = User.new
    end
    
    
    def show
        User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
         flash[:success] = "Welcome to the WeInvest blog #{@user.username}"
         redirect_to articles_path
        else
         render 'new'
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(edit_params)
         flash[:success] = "Your account was updated successfully"
         redirect_to articles_path
        else
         render 'edit'
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end

        def edit_params
            params.require(:user).permit(:username, :password)
        end
end