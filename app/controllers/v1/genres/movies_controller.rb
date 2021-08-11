class V1::Genres::MoviesController < V1::Genres::BaseController

    before_action :set_movies, only: [:show, :update, :destroy]


    def index
        @movies = @genre.movies.all
        @movies = apply_pagination @movies

        render_success(data: {
            movies: @movies.as_api_response(:base),
            pagination: pagination(@movies)
        })
    end

    def show
        if render_success(data: {
                movie: @genre.movies.as_api_response(:base)
            })
        else
            render_error message: "Data Not Found", data: {error: @movies.errors}
        end

    end


    def create
        @movie = @genre.movies.create(movies_params)
        if @movie.save
        render_success message: "movie has been created", data: {
            genres: @movie
        }
        else
        render_error message: "Not Created" , data: {error: @movie.errors}
        end
    end

    def update
        if @movie.update(movies_params)
            render_success message: "movie has updated successfully", data: {
                movie: @movie
            }
        else
            render_error message: "Not Updated", data: {error: @movie.errors}
        end

    end

    def destroy
        if @movie.destroy
            render_success message: "movie has deleted successfully", data: {
                movie: @movie
            }
        else
            render_error message: "Not deleted", data: {error: @movie.errors}
        end


    end

    private 

    def movies_params
        params.require(:movies).permit(:name, :title, :release_date, :movie_length, :language,
        :movie_release_country, :rating, :overview, :tagline)
    end


    def set_movies
        @movie = @genre.movies.find(params[:id])
    end  
    

end 
