class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create 
        if request.env['omniauth.auth'] != nil
            @user = User.find_by(name: request.env['omniauth.auth']['info']['name'])
          else
            @user = User.find_by(name: params[:name])
          end
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            render new_user_path
        end
    end 

    def edit 
        @user = User.find(params[:id])
    end 

    #this will not work at the moment
    def update
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            render new_user_path
        end
    end 

    def show 
        @user = User.find(params[:id])
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
