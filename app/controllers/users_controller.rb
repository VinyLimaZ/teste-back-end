class UsersController < ActionController::API

  def create
    user = User.new(user_params)
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
end
