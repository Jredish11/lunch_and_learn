class Api::V1::YoutubesController < ApplicationController
  def index
    country = params[:country]
    videos = YoutubeFacade.new(country).videos
     p = render json: YoutubeSerializer.new(videos)
     require 'pry'; binding.pry
  end
end
