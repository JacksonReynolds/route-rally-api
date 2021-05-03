class RoutesController < ApplicationController

  def index
    endpoint = "https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=#{search_params[:latitude]}&lon=#{search_params[:longitude]}&maxDistance=#{search_params[:max_distance]}&minDiff=#{search_params[:min_difficulty]}&maxDiff=#{search_params[:max_difficulty]}&maxResults=#{search_params[:quantity]}&key=#{ENV["MP_KEY"]}"

    api = MpApi::DataFromApi.new(endpoint)
    route_data = api.get_data
    
    if route_data['success'] === 1
      render json: route_data, status: :ok
    else 
      render json: {errorMessage: "No something bad happened with that query, make sure your search terms are correct"}, status: :service_unavailable
    end
  end

  private

  def search_params
    params.require(:search).permit(
      :latitude,
      :longitude,
      :max_distance,
      :min_difficulty,
      :max_difficulty,
      :quantity
    )
  end

end
