class V1::Genre::BaseController < ApplicationController

    before_action :set_genres
    protected
  
    def set_genres
      @genre = Genre.find(params[:genre_id])
    end

end