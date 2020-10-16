class ReviewsController < ApplicationController

  get '/reviews' do
    @reviews = Review.all
    erb :'reviews/index'
  end

  get '/reviews/:id' do
    @review = Review.find(params[:id])
    erb :"reviews/show"

  end

end
