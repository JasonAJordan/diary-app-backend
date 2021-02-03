class DayStickersController < ApplicationController
    def index 
        dayStickers = DaySticker.all 
        render json: dayStickers, except:[:updated_at, :created_at]
    end 

    def show 
        daySticker = DaySticker.find_by(id: params[:id])
        render json: daySticker
    end 

end
