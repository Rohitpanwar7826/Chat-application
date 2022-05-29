class SessionsController < ApplicationController

  def sign_in
    if current_user
      system "clear"
      puts current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def veirfy_user
    @user = User.find_by(email: params_permit["email"])
    if @user && @user.authenticate(params_permit["password"])
      login_user(@user)
      redirect_to root_path
    else
      flash[:alert] = "User not found"
      render :sign_in , status: :unprocessable_entity
    end
  end

  def destroy
    if session[:current_user]
      session.delete(:current_user)
      redirect_to sign_in_path
    else 
      redirect_to sign_in_path
    end
  end

  private
  def params_permit 
    params.require(:user).permit(:email,:password)
  end
end
