class PostsController < ApplicationController

    def index 
        posts = Posts.all 
        render json: posts, except:[:updated_at, :created_at]
    end 


end
