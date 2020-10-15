class UsersController < ApplicationController
  
  get "/login" do 
    erb :"login"
  end
  
  post "/login" do 
    erb :"/login"
  end
end