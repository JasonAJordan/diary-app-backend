class UsersController < ApplicationController 

    def index 
        users = User.all 
        render json: users, except:[:updated_at, :created_at]
    end 

    def new 
        user = User.new 
    end 
    
    def show 
        user = User.find_by(id: params[:id])
        render json: user
    end 
        


end 