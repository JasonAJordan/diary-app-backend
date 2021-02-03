class DaysController < ApplicationController

    def index 
        days = Days.all 
        render json: days, except:[:updated_at, :created_at]
    end 

    def show 
        day = Day.find_by(id: params[:id])
        render json: day
    end 

end
