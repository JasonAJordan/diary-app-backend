class StickersController < ApplicationController


    def index 
        stickers = Sticker.all 
        render json: stickers, except:[:updated_at, :created_at]
    end 

    def show 
        sticker = Sticker.find_by(id: params[:id])
        render json: sticker
    end 


end

