class AuthController < ApplicationController

  #post /register
  def register
    register_params = params.permit(:username, :password, :name, :bio)

    user = User.create(register_params)

    if user.valid?
      # session[:user_id] = user.id
      # redirect_to "/"
      token = encode_token({ user_id: user.id })
      #render json: user, status: :created
      render json: {user: UserSerializer.new(user), token: token }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #post "/login"
  def login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      secret = Rails.application.secrets.secret_key_base
      #token = encode_token({ user_id: user.id })
      token = JWT.encode({user_id: user.id}, secret, "HS256")
      render json: { user: UserSerializer.new(user), token: token }
      #render json: user 
    else 
      render json: { failure: "Invalid Username or Password"} #, status: :unauthorized
    end

  end  


  def authenticate
    @current_user = AuthorizeRequest.new(request.headers).user
    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  end

  private

  def register_params
    params.permit(:username, :password, :bio, :name)
  end
  
  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base, "HS256")
  end


end
