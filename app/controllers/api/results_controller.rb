module Api
  class ResultsController < ApplicationController


    rescue_from Mongoid::Errors::DocumentNotFound do |exception|
      @msg = "woops: cannot find result[#{params[:id]}]"
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
        render plain: "/api/races/#{params[:race_id]}/results"
      else
        #real implementation ...
        #race.entrants.max(:updated_at)
        @race=Race.find(params[:race_id])
        @entrants=@race.entrants
      end
    end
    
    def show
      if !request.accept || request.accept == "*/*"
       render plain: "/api/races/#{params[:race_id]}/results/#{params[:id]}"
      else
        #real implementation ...

         @result = Race.find(params[:race_id]).entrants.where(id: params[:id]).first
         render :partial=>"result", :object=>@result
         
      end
    end  

    def update
      entrant = Race.find(params[:race_id]).entrants.where(id: params[:id]).first

      #@result.update(race_params)
      result=params[:result]
      if result
        if result[:swim]
          entrant.swim=entrant.race.race.swim
          entrant.swim_secs = result[:swim].to_f
        end
        if result[:t1]
          entrant.t1=entrant.race.race.t1
          entrant.t1_secs = result[:t1].to_f
        end
        if result[:t2]
          entrant.t2=entrant.race.race.t2
          entrant.t2_secs = result[:t2].to_f
        end
        if result[:bike]
          entrant.bike=entrant.race.race.bike
          entrant.bike_secs = result[:bike].to_f
        end
        if result[:run]
          entrant.run=entrant.race.race.run
          entrant.run_secs = result[:run].to_f
        end
      end  
      entrant.save

      render json: entrant, status: :ok

    end 
    
    private
    def result_params
      params.require(:result).permit(:swim, :t1, :bike, :t2, :run)
    end 

  end
end