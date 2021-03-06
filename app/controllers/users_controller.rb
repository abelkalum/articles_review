class UsersController < ApplicationController
 
  get '/signup' do
    redirect_if_logged_in
    erb :signup
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/login'
    else
      redirect '/signup'
    end
  end
  
  get '/login' do
    redirect_if_logged_in
    erb :login
  end
  
  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    else
      redirect '/login'
    end
  end
  
  get '/users/:id' do
    @user = User.find_by(username: params[:username])
    redirect_if_not_logged_in
    
    erb :'/users/show'
  end
  
  get '/logout' do
    session.clear
    redirect '/'
  end

end