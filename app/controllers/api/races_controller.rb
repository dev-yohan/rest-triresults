module Api
  class RacesController < ApplicationController

    def index

      if !request.accept || request.accept == "*/*"
        render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
      else
        #real implementation ...

      end
    end
    
    def show
      if !request.accept || request.accept == "*/*"
        render plain: "/api/races/#{params[:id]}"
      else
        #real implementation ...
        race = Race.find(params[:id])
        render json: race, status: :ok
      end
    end  

    def create
      if !request.accept || request.accept == "*/*"
        render plain: params[:race][:name], status: :ok
      else
        #real implementation
        race = Race.new(race_params)
        race.save
        render plain: race.name, status: :created
      end
    end  

    def update
      race = Race.find(params[:id])
      race.update(race_params)
      race.save

      render json: race, status: :ok
    end  

  private
    def race_params
      params.require(:race).permit(:name, :date)
    end

  end
end