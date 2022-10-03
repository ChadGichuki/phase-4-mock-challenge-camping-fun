class CampersController < ApplicationController
    wrap_parameters format: []

    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find_by!(id: params[:id])
        render json: camper, serializer: ShowCamperSerializer, status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: {error: "Camper not found"}, status: :not_found
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
        rescue ActiveRecord::RecordInvalid => e
            render json: {errors: e.record.errors.full_messages}, status: 422
    # rescue ActiveRecord::Validations => invalid
    #     render json: {errors: invalid.model.errors}
    end

    private
    def camper_params
        params.permit(:name, :age)
    end
end
