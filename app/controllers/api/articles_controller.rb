class Api::ArticlesController < ApplicationController
  def index
    response = Unirest.get("https://newsapi.org/v2/top-headlines?country=ae&apiKey=#{ENV["NEWS_API_KEY"]}")
    render json: response.body["articles"]

    # @articles = Article.all
    # render "index.json.jbuilder"
  end
end
