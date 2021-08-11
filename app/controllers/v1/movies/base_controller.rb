class V1::Movies::BaseController < ApplicationController

    before_action :set_movies
    protected
  
    def set_movies
      @movie = Movie.find(params[:movie_id])
    end

end