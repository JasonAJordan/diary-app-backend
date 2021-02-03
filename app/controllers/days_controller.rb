class DaysController < ApplicationController

    def index 
        days = Days.all 
        render json: days, except:[:updated_at, :created_at]
    end 


end
