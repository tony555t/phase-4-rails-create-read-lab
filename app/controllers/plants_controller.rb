class PlantsController < ApplicationController

    # GET /plants
    def index
      plants = Plant.all
      render json: plants
    end
  
    # GET /plants/:id
    def show
      plant= Plant.find_by(id: params[:id])
      if plant
        render json: plant
      else
        render json: { error: "plant not found" }, status: :not_found
      end
    end

    def create 
        plant = Plant.create(params.permit(:name, :image, :price))
        if plant 
            render json: plant, status: :created
        else
            render json: {error: "Error occurred while creating a Plant"}, status: :not_found
        end
    end
end
  