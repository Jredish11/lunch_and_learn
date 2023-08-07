class Api::V1::AirQualityController < ApplicationController
  def show
    country = params[:country]
    aq = AirQualityFacade.air_quality(country)
    render json: AirQualitySerializer.new(aq)
  end
end
