class UsersController < ApplicationController 

    def index 
        users = User.all 
        render json: users, except:[:updated_at, :created_at]
    end 

    def show 
        user = User.find_by(id: params[:id])
        render json: user
    end 
        
    def new 
        user = User.new
    end 

    def create 
        user = User.create(user_params)
        render json: user, except:[:updated_at, :created_at]
    end 

    def edit 
        user = User.find_by(id: params[:id])
    end 

    def update
        user = User.find_by(id: params[:id])
        user.update(user_params)
        render json: user
    end 
    
    def destroy 
        user = User.find_by(id: params[:id])
        user.destroy
        render json: user 
    end 

    private 

    def user_params 
        params.permit(:username, :password, :name, :bio)
    end 


end 