class UsersController < ApplicationController
  def create
    user = join_access(User.new(user_params))

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

  def join_access(user)
    user.tap { |u| u.accesses << Access.find_by_uuid(params.dig(:user, :uuid)) }
  end
end
