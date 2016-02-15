module Api
  class ResultsController < ApplicationController

    def index
      if !request.accept || request.accept == "*/*"
        render plain: "/api/races/#{params[:race_id]}/results"
      else
        #real implementation ...
        #race.entrants.max(:updated_at)
        @race = Race.find(params[:race_id])
        @results = @race.entrants
        fresh_when(last_modified: @race.entrants.max(:updated_at), public: true)
        render :json => {success: "ok"}, :status => :ok
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

  end
end