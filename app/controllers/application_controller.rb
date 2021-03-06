require "./config/environment"
require "./app/models/user"
require "./app/models/article"
require "./app/models/review"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end
 
  get '/' do
    redirect_if_logged_in
    erb :'/welcome'
  end
   
  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
    end

    def authorized_to_edit?(review)
      review.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/'
      end
    end
   
    def redirect_if_logged_in
      if logged_in?
        redirect "/users/#{current_user.id}"
      end
      
    end

  end

end   