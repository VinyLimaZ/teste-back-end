class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    accesses = Access.where(uuid: params.dig(:user, :uuid), user_id: nil)

    if user.save
      JoinUserWithAccessService.call(user, accesses)
      render json: { status: :created }
    else
      render json: user.errors.full_messages.to_sentence, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
