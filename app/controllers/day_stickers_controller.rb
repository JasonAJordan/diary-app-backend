class DayStickersController < ApplicationController
    def index 
        dayStickers = DaySticker.all 
        render json: dayStickers, except:[:updated_at, :created_at]
    end 

end
