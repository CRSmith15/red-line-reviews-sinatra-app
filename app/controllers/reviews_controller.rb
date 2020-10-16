class ReviewsController < ApplicationController

  get "/reviews" do
    @reviews = Review.all
    erb :'reviews/index'
  end

  get "/reviews/new" do
    erb :"/reviews/new"
  end

  get "/reviews/:id" do
    @review = Review.find(params[:id])
    erb :"reviews/show"
  end

  post "/reviews" do
    rev = Review.create(game_title: params[:game_title], score: params[:score], description: params[:description], user_id: current_user.id)
    redirect "/reviews/#{rev.id}"
  end



end
