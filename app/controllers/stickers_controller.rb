class StickersController < ApplicationController


    def index 
        stickers = Sticker.all 
        render json: stickers, except:[:updated_at, :created_at]
    end 

    def show 
        sticker = Sticker.find_by(id: params[:id])
        render json: sticker
    end 

    def new 
        sticker = Sticker.new
    end 

    def create 
        if params[:image].instance_of?(String)
            sticker = Sticker.create(sticker_params)
            render json: sticker, except:[:updated_at, :created_at]
        else 
        imageUploaded = Cloudinary::Uploader.upload(params[:image])
        #puts "asdfasdfasdfasdf"
        sticker_params_new = sticker_params
        sticker_params_new[:image] = imageUploaded["url"]
        sticker = Sticker.create(sticker_params_new)
        render json: sticker, except:[:updated_at, :created_at]
        end
    end 

    def edit 
        sticker = Sticker.find_by(id: params[:id])
    end 

    def update
        sticker = Sticker.find_by(id: params[:id])
        sticker.update(sticker_params)
        render json: sticker
    end 
    
    def destroy 
        sticker = Sticker.find_by(id: params[:id])
        sticker.destroy
        render json: sticker 
    end 

    private 

    def sticker_params 
        params.permit(:user_id, :name, :image)
    end 


end

