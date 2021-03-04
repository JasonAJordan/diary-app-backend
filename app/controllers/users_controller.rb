class UsersController < ApplicationController 

    #before_action :authenticate

    def index 
        users = User.all 
        render json: users, except:[:updated_at, :created_at]
    end 

    def show 

        # user = User.find_by(id: params[:id])
        # render json: user

        # auth_token = headers['Authorization'].split.last if headers['Authorization'].present?
        # begin
        #   decoded_token = JWT.decode(auth_token, Rails.application.secrets.secret_key_base, true, { algorthim: 'HS256' })[0]
        #   user = User.find(decoded_token['user_id'])
        #   user.update(name: params[:name], bio: params[:bio])
        #   render json: user
        # rescue
        #   render json: { error: "Unauthorized" }, status: :unauthorized
        # end

        user = AuthorizeRequest.new(request.headers).user
        if user
          #user.update(name: params[:name], bio: params[:bio])
          render json: user
        else
          render json: { error: "Unauthorized" }, status: :unauthorized
        end

        # @current_user.update(name: params[:name], bio: params[:bio])
        # render json: @current_user


    end 
        
    def new 
        user = User.new
    end 

    def create 
        user = User.create(user_params)
        render json: user, except:[:updated_at, :created_at]
    end 

    def edit 
        user = User.find_by(id: params[:id])
    end 

    def update
        user = User.find_by(id: params[:id])

        # if params[:picture].instance_of?(String)
        #     user.update(user_params)
        #     render json: user
        # else 
        # imageUploaded = Cloudinary::Uploader.upload(params[:image])
        # #puts "asdfasdfasdfasdf"
        # user_params_new = user_params
        # user_params_new[:picture] = imageUploaded["url"]
        # user.update(user_params_new)
        # render json: user
        # end

        #non image uploading 
        user.update(user_params)
        render json: user
    end 
    
    def destroy 
        user = User.find_by(id: params[:id])
        user.destroy
        render json: user 
    end 

    private 

    def user_params 
        params.permit(:username, :password, :name, :bio, :picture)
    end 


end 