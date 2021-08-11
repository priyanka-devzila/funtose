class V1::GenresController < ApplicationController

    before_action :set_genre, only: [:show, :update, :destroy]


    def index
        @genre = Genre.all
        @genre = apply_pagination @genre

        render_success(data: {
            genre: @genre.as_api_response(:base),
            pagination: pagination(@genre)
        })
    end

    def show
        if render_success(data: {
                genre: @genre.as_api_response(:base)
            })
        else
            render_error message: "Data Not Found", data: {error: @genre.errors}
        end

    end


    def create
        @genre = Genre.create(genre_params)
        if @genre.save
        render_success message: "Genre has been created", data: {
            genre: @genre
        }
        else
        render_error message: "Not Created" , data: {error: @genre.errors}
        end
    end

    def update
        if @genre.update(genre_params)
            render_success message: "Genre has updated successfully", data: {
                genre: @genre
            }
        else
            render_error message: "Not Updated", data: {error: @genre.errors}
        end

    end

    def destroy
        if @genre.destroy
            render_success message: "Genre has deleted successfully", data: {
                genre: @genre
            }
        else
            render_error message: "Not deleted", data: {error: @genre.errors}
        end


    end

    private 

    def genre_params
        params.require(:genre).permit(:name)
    end


    def set_genre
        @genre = Genre.find(params[:id])
    end  

end 
