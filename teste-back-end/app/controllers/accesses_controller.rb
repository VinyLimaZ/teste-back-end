class AccessesController < ApplicationController
  def verify_uuid
    if Access.uuid_uniq?(params[:uuid])
      render json: { status: :bad_request }
    else
      render json: { status: :ok }
    end
  end

  def index
    access_report = AccessReportSerializers.call
    render json: access_report, status: :ok
  end

  def create
    access = Access.new(access_params)

    if access.save
      render json: { status: :created }
    else
      render json: access.errors.full_messages.to_sentence, status: :bad_request
    end
  end

  private

  def access_params
    params.permit(:uuid, :date_time, :path)
  end
end
