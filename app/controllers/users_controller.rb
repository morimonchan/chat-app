class UsersController < ApplicationController
  
  def edit

  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
      # root_pathとは?????
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
    # user情報のnameとemailの情報を取り出すことが出来る。
  end

end
