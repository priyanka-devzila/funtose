class V1::ActorsController < ApplicationController

    before_action :set_actors, only: [:show, :update, :destroy]


    def index
        @actors = Actor.all
        @actors = apply_pagination @actors

        render_success(data: {
            actors: @actors.as_api_response(:base),
            pagination: pagination(@actors)
        })
    end

    def show
        if render_success(data: {
                actors: @actors.as_api_response(:show)
            })
        else
            render_error message: "Data Not Found", data: {error: @actors.errors}
        end

    end


    def create
        @actors = Actor.create(actors_params.except(:movie_ids))
        if @actors.save
            @actors.movies << Movie.where(id: params.require(:actor)[:movie_ids])
            render_success message: "actor has been created", data: {
            actors: @actors
        }
        else
        render_error message: "Not Created" , data: {error: @actors.errors}
        end
    end

    def update
        if @actors.update(actors_params)
            render_success message: "actor has updated successfully", data: {
                actors: @actors
            }
        else
            render_error message: "Not Updated", data: {error: @actors.errors}
        end

    end

    def destroy
        if @actors.destroy
            render_success message: "actor has deleted successfully", data: {
                actors: @actors
            }
        else
            render_error message: "Not deleted", data: {error: @actors.errors}
        end


    end

    private 

    def actors_params
        params.require(:actor).permit(:name,
        :gender, 
        :date_of_birth,
        :movie_ids => []
        )
    end


    def set_actors
        @actors = Actor.find(params[:id])
    end  

    def something
    end
end 
