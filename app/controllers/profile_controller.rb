class ProfileController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to profile_path, notice: "Perfil actualizado"
    else
      render :edit
    end
  end

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

end
