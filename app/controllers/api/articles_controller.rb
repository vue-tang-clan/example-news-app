class Api::ArticlesController < ApplicationController
  def index
    response = Unirest.get("https://newsapi.org/v2/top-headlines?country=ae&apiKey=___")
    render json: response.body["articles"]

    # @articles = Article.all
    # render "index.json.jbuilder"
  end
end
