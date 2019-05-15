class UsersController < ApplicationController
  def create
    user = JoinUserWithAccessServices.join(User.new(user_params))

    if user.save
      render json: { status: :created }
    else
      render json: user.errors.full_messages.to_sentence, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :uuid)
  end
end
