class V1::Movies::ActorsController < V1::Movies::BaseController

    before_action :set_actors, only: [:show, :update, :destroy]


    def index
        @actors = @movie.actors
        @actors = apply_pagination @actors

        render_success(data: {
            actors: @actors.as_api_response(:base),
            pagination: pagination(@actors)
        })
    end

    def show
        if render_success(data: {
                actors: @movie.actors.as_api_response(:base)
            })
        else
            render_error message: "Data Not Found", data: {error: @actors.errors}
        end

    end


    def create
        @actors = @movie.actors.create(actors_params)
        if @actors.save
        render_success message: "actor has been created", data: {
            actors: @actors
        }
        else
        render_error message: "Not Created" , data: {error: @actors.errors}
        end
    end

    def update
        if @actor.update(actors_params)
            render_success message: "actor has updated successfully", data: {
                actors: @actors
            }
        else
            render_error message: "Not Updated", data: {error: @actors.errors}
        end

    end

    def destroy
        if @actor.destroy
            render_success message: "actor has deleted successfully", data: {
                actors: @actors
            }
        else
            render_error message: "Not deleted", data: {error: @actors.errors}
        end


    end

    private 

    def actors_params
        params.require(:actors).permit(:first_name, :last_name, :nationality, :date_of_birth)
    end


    def set_actors
        @actor = @movie.actors.find(params[:id])
    end  
    

end 
