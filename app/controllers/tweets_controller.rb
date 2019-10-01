class TweetsController < ApplicationController
 get '/tweets' do
   if !!session[:user_id]
    @tweets = Tweet.all
    erb :"/tweets/tweets"
 else
    redirect "/login"
 end
end

 get '/tweets/new' do
    @tweets = Tweet.all
    erb :"/tweets/new" 
 end

 post '/tweets' do
    @tweet = Tweet.create(params[:tweet])
    @tweet.save
    redirect to "/tweets/#{@tweet.id}"
 end

 get '/tweet/:id' do
    @tweet = Tweet.find(params[:id])
   erb :"/tweets/show"
 end

get '/tweet/:id/edit' do
    @tweet = Tweet.find(params[:id])
    erb :"/tweets/edit"
end

patch '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    if params[:tweet][:content].empty?
        redirect "/tweets/#{@tweet.id}/edit"
    end
    @tweet.update(params[:tweet])
    @tweet.save
    redirect "/tweets/#{@tweet.id}"
end
end