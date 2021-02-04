class DayStickersController < ApplicationController
    def index 
        dayStickers = DaySticker.all 
        render json: dayStickers, except:[:updated_at, :created_at]
    end 

    def show 
        daySticker = DaySticker.find_by(id: params[:id])
        render json: daySticker
    end 


    def new 
        daySticker = DaySticker.new
    end 

    def create 
        daySticker = DaySticker.create(daySticker_params)
        render json: daySticker, except:[:updated_at, :created_at]
    end 

    def edit 
        daySticker = DaySticker.find_by(id: params[:id])
    end 

    def update
        daySticker = DaySticker.find_by(id: params[:id])
        daySticker.update(daySticker_params)
        render json: daySticker
    end 
    
    def destroy 
        daySticker = DaySticker.find_by(id: params[:id])
        daySticker.destroy
        render json: daySticker 
    end 

    private 

    def daySticker_params 
        params.permit(:day_id, :sticker_id)
    end 


end
