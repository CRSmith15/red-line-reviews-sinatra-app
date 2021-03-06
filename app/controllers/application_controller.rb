require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "destroy_all_humans"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end


 helpers do
   def logged_in?
     !!current_user
   end

   def current_user
     User.find_by(id: session[:user_id])
   end

   def auth_to_edit?(rev)
     rev.user == current_user
   end

 end

end
