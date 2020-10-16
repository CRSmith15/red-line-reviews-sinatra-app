class ReviewsController < ApplicationController

  get "/reviews" do
    @reviews = Review.all
    erb :'reviews/index'
  end

  get "/reviews/new" do
    if logged_in?
      erb :"/reviews/new"
    else
      flash[:error] = "Log in to create a new review."
      redirect "/"
    end
  end

  get "/reviews/:id" do
    @review = Review.find(params[:id])
    erb :"reviews/show"
  end

  post "/reviews" do
    rev = Review.new(game_title: params[:game_title], score: params[:score], description: params[:description], user_id: current_user.id)
    if rev.save
      flash[:message] = "Created review successfully!"
      redirect "/reviews/#{rev.id}"
    else
      flash[:error] = "Review creation failed: #{rev.errors.full_messages.to_sentence}"
      redirect "/reviews/new"
    end
  end

  get "/reviews/:id/edit" do
    @review = Review.find(params[:id])
    erb :'/reviews/edit'
  end

  patch "/reviews/:id" do
    @review = Review.find(params[:id])
    @review.update(game_title: params[:game_title], score: params[:score], description: params[:description])
    redirect "/reviews/#{@review.id}"
  end


  delete "/reviews/:id" do
    @review = Review.find(params[:id])
    @review.destroy
    redirect '/reviews'
  end


end
