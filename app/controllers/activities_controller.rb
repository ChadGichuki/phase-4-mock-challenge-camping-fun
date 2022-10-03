class ActivitiesController < ApplicationController
    def index
        render json: Activity.all, status: :ok
    end

    def destroy
        activity = Activity.find_by!(id: params[:id])
        activity.destroy
        head :no_content
        rescue ActiveRecord::RecordNotFound => e
            render json: {error: "Activity not found"}, status: :not_found
    end
end
