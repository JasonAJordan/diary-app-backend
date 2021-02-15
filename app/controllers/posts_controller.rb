class PostsController < ApplicationController

    def index 
        posts = Post.all 
        render json: posts, except:[:updated_at, :created_at]
    end 


    def show 
        post = Post.find_by(id: params[:id])
        render json: post
    end 
    

    def new 
        post = Post.new
    end 

    def create 
        # post = Post.create(post_params)
        # render json: post, except:[:updated_at, :created_at]


        if params[:image].instance_of?(String) || params[:image].nil?
            post = Post.create(post_params)
            render json: post, except:[:updated_at, :created_at]
        else 
        imageUploaded = Cloudinary::Uploader.upload(params[:image])
        #puts "asdfasdfasdfasdf"
        post_params_new = post_params
        post_params_new[:image] = imageUploaded["url"]
        post = Post.create(post_params_new)
        render json: post, except:[:updated_at, :created_at]
        end
    end 

    def edit 
        post = Post.find_by(id: params[:id])
    end 

    def update
        post = Post.find_by(id: params[:id])
        post.update(post_params)
        render json: post
    end 
    
    def destroy 
        post = Post.find_by(id: params[:id])
        post.destroy
        render json: post 
    end 

    private 

    def post_params 
        params.permit(:title, :context, :text_color, :image, :day_id)
    end 

end
