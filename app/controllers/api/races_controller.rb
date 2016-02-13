module Api
  class RacesController < ApplicationController

    rescue_from Mongoid::Errors::DocumentNotFound do |exception|
      @msg = "woops: cannot find race[#{params[:id]}]"
      if !request.accept || request.accept == "*/*"
        render plain: @msg, status: :not_found
      else
        respond_to do |format|
          format.json { render "api/error_msg", status: :not_found, content_type: "#{request.accept}" }
          format.xml  { render "api/error_msg", status: :not_found, content_type: "#{request.accept}" }
        end
      end
    end

    def index

      if !request.accept || request.accept == "*/*"
        render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
      else
        #real implementation ...

      end
    end
    
    def show
      if !request.accept || request.accept == "*/*"
        #render plain: "woops: cannot find race[#{params[:id]}]", status: :not_found
        render :status=>:not_found, 
               :template=>"api/error_msg", 
               :locals=>{ :msg=>"woops: cannot find race[#{params[:id]}]"}
      else
        #real implementation ...
          @race = Race.find(params[:id])
          #render json: race, status: :ok
          render @race, content_type: "#{request.accept}"
         
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

    def destroy
      race = Race.find(params[:id])
      race.delete

      render :nothing=>true, :status => :no_content
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