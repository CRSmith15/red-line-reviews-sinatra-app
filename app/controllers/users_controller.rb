class UsersController < ApplicationController

  get "/login" do
    erb :"login"
  end

  post "/login" do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome back #{user.name}!"
      redirect "/users/#{user.id}"
    else
      flash[:error] = "Your credentials were incorrect. Try again!"
      redirect "/login"
    end
  end

  get "/users/:id" do
    @user = User.find_by(id: params[:id])
    erb :"/users/show"
  end

  get "/signup" do
    erb :"/users/signup"
  end

  get "/signup" do
    erb :"/signup"
  end

  post "/users" do
    @user = User.new(params)
    if @user.save
      flash[:message] = "Account creation successful!"
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:error] = "Account creation failed: #{@user.errors.full_messages.to_sentence}"
      redirect "/signup"
    end
  end

  get "/users/reviews/:id" do
    @review = Review.find(params[:id])
    redirect "/reviews/#{@review.id}"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end
end
