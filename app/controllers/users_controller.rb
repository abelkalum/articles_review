class UsersController < ApplicationController
  get '/signup' do
    redirect_if_logged_in
    erb :signup
  end
 
  post '/signup' do
    user = User.new(username: params[:username], password: params[:password])
    if user.save
      redirect "/login"
    else
      erb :'/signup'
    end
  end
 
  get '/login' do
    erb :login
  end
 
  post '/login' do
    redirect "users/#{@user.id}"
  end

  get '/users/:id' do

    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end