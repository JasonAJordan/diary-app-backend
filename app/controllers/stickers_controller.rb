class StickersController < ApplicationController


    def index 
        stickers = Sticker.all 
        render json: stickers, except:[:updated_at, :created_at]
    end 


end

