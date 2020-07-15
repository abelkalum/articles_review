require './config/environment'

class ApplicationController < Sinatra::Base

  configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "fastly"
    end
 
    get '/' do
      erb :"/application/home"
    end

end
