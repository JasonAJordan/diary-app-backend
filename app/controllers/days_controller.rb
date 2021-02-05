class DaysController < ApplicationController

    def index 
        days = Day.all 
        render json: days, except:[:updated_at, :created_at]
    end 

    def show 
        day = Day.find_by(id: params[:id])
        render json: day
    end 


    def new 
        day = Day.new
    end 

    def create 
        day = Day.create(day_params)
        render json: day, except:[:updated_at, :created_at]
    end 

    private 

    def day_params 
        params.permit(:date, :user_id)
    end 

end
