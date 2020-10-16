require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "destroy_all_humans"
  end

  get "/" do
    erb :welcome
  end


 helpers do
   def current_user
     User.find_by(id: session[:user_id])
   end

 end

end
