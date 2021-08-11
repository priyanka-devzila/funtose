class V1::Actors::BaseController < ApplicationController

    before_action :set_actors
    protected
  
    def set_actors
      @actor = Actor.find(params[:actor_id])
    end

end