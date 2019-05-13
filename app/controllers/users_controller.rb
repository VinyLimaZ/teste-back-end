class UsersController < ApplicationController
  def create
    user = JoinUserWithAccessService.join(User.new(user_params), uuid_param))

    if user.save
      render json: { status: :created }
    else
      render json: user.errors.full_messages.to_sentence, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def uuid_param
    params.require(:user).permit(:uuid)
  end
end
