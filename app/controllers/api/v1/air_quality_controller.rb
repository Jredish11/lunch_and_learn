class Api::V1::AirQualityController < ApplicationController
  def show
    country = params[:country]
    # capital = CountryFacade.new(country).get_capital
    # require 'pry'; binding.pry
    aq = AirQualityFacade.air_quality(country)
    render json: AirQualitySerializer.new(aq)
  end
end
