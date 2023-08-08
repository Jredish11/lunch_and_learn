class Api::V1::YoutubesController < ApplicationController
  def index
    country = params[:country]
    videos = YoutubeFacade.new(country).videos
    render json: YoutubeSerializer.new(videos)
    
  end
end
