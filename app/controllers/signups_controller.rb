class SignupsController < ApplicationController
    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.record.errors.full_messages}, status: 422
    # rescue ActiveRecord::Validations => invalid
    #     render json: {errors: invalid.model.errors}
    end

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
