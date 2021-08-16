class V1::MoviesController < ApplicationController

    before_action :set_movies, only: [:show, :update, :destroy]


    def index
        @movies = Movie.all
        @movies = @movies.search(params[:search]) if params[:search].present?
        @movies = apply_pagination @movies
        

        render_success(data: {
            movies: @movies.as_api_response(:base),
            pagination: pagination(@movies)
        })
    end

    def show
        if render_success(data: {
                movies: @movies.as_api_response(:show)
            })
        else
            render_error message: "Data Not Found", data: {error: @movies.errors}
        end

    end


    def create
        #render json: movies_params
        @movies = Movie.create(movies_params.except(:actor_ids, :genre_ids))
        if @movies.save
            @movies.actors << Actor.where(id: params.require(:movie)[:actor_ids])
            @movies.genres << Genre.where(id: params.require(:movie)[:genre_ids]) 
            render_success message: "movies has been created", data: {
            movies: @movies
            }
        else
            render_error message: "Not Created" , data: {error: @movies.errors}
        end
    end

    def update
        if @movies.update(movies_params)
            render_success message: "movies has updated successfully", data: {
                movies: @movies
            }
        else
            render_error message: "Not Updated", data: {error: @movies.errors}
        end

    end

    def destroy
        if @movies.destroy
            render_success message: "movies has deleted successfully", data: {
                movies: @movies
            }
        else
            render_error message: "Not deleted", data: {error: @movies.errors}
        end


    end

    private 

    def movies_params
        params.require(:movie).permit(:title, 
        :release_date, 
        :movie_length_in_minutes, 
        :rating, 
        :overview,
        :actor_ids => [],
        :genre_ids => []
        )
    end


    def set_movies
        @movies = Movie.find(params[:id])
    end  

end 
