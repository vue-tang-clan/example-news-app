class Api::SpotifyController < ApplicationController
  def authorize
    redirect_to "https://accounts.spotify.com/authorize?client_id=#{ENV["SPOTIFY_CLIENT_ID"]}&response_type=code&redirect_uri=http://localhost:3000/api/spotify/callback"
  end

  def callback
    # get the access token
    response = Unirest.post("https://accounts.spotify.com/api/token",
      parameters: {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: "http://localhost:3000/api/spotify/callback",
        client_id: ENV["SPOTIFY_CLIENT_ID"],
        client_secret: ENV["SPOTIFY_CLIENT_SECRET"]
      }
    )
    access_token = response.body["access_token"]

    # Use the access token to make an authorized request
    response = Unirest.get("https://api.spotify.com/v1/search?q=Kanye&type=artist",
      headers: {"Authorization" => "Bearer #{access_token}"}
    )

    render json: response.body
  end
end
