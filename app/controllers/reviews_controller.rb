 class ReviewsController < ApplicationController

  get '/reviews' do
    @reviews = Review.all
    erb :'reviews/index'
  end

  get '/reviews/new' do
    redirect_if_not_logged_in
    erb :'/reviews/new'
  end

  post '/reviews' do
    redirect_if_not_logged_in
    @review = Review.create(user_id: @user.id, article_id: @article.id, text: params[:user][:review])
    redirect "/reviews/#{@review.id}"
  end

  get '/reviews/:id' do
    set_review
    erb :'/reviews/show'
  end

  get '/reviews/:id/edit' do
    redirect_if_not_logged_in
    set_review
    if authorized_to_edit?(@review)
      erb :'/reviews/edit'
    else
      redirect "users/#{current_user.id}"
    end
  end

  patch '/reviews/:id' do
    redirect_if_not_logged_in
    set_review
    if @review.user == current_user && params[:user][:review] != ""
      @review.update(content: params[:user][:review])
      redirect "/reviews/#{@review.id}"
    else
      redirect "users/#{current_user.id}"
    end
  end

  delete '/reviews/:id' do
    set_review
    if authorized_to_edit?(@review)
      @review.destroy
      redirect '/reviews'
    else
      redirect '/reviews'
    end
  end
 
  private

  def set_review
    @review = Review.find(params[:id])
  end
end