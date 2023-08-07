class Api::V1::AirQualityController < ApplicationController
  def show
    country = params[:country]
    capital = CountryFacade.get_capital(country)
    aq = AirQualityFacade.air_quality(capital)
    render json: AirQualitySerializer.new(aq)
  end
end
