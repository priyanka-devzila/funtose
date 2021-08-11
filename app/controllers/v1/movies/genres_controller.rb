class V1::Movies::GenresController < V1::Movies::BaseController

    before_action :set_genres, only: [:show, :update, :destroy]


    def index
        @genres = @movie.genres.all
        @genres = apply_pagination @genres

        render_success(data: {
            genres: @genres.as_api_response(:base),
            pagination: pagination(@genres)
        })
    end

    def show
        if render_success(data: {
                genres: @movie.genres.as_api_response(:base)
            })
        else
            render_error message: "Data Not Found", data: {error: @genres.errors}
        end

    end


    def create
        @genres = @movie.genres.create(genres_params)
        if @genres.save
        render_success message: "genre has been created", data: {
            genres: @genres
        }
        else
        render_error message: "Not Created" , data: {error: @genres.errors}
        end
    end

    def update
        if @genre.update(genres_params)
            render_success message: "genre has updated successfully", data: {
                genres: @genres
            }
        else
            render_error message: "Not Updated", data: {error: @genres.errors}
        end

    end

    def destroy
        if @genre.destroy
            render_success message: "genre has deleted successfully", data: {
                genres: @genres
            }
        else
            render_error message: "Not deleted", data: {error: @genres.errors}
        end


    end

    private 

    def genres_params
        params.require(:genres).permit(:first_name, :last_name, :nationality, :date_of_birth)
    end


    def set_genres
        @genre = @movie.genres.find(params[:id])
    end  
    

end 
