class Api::V1::FeedbacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      render json: { message: 'Feedback submitted successfully' }, status: :created
    else
      render json: { errors: @feedback.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :comment)
  end
end

# app/controllers/api/v1/feedbacks_controller.rb

class Api::V1::FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      render json: { message: 'Feedback submitted successfully' }, status: :ok
    else
      render json: { errors: @feedback.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :comment)
  end
end
