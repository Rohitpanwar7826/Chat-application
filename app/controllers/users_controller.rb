class UsersController < ApplicationController

  def new
    if current_user 
      redirect_to root_path 
    else
        @users = User.new
    end

  end

  def create 
  
    @users = User.new(permite_params_users)
  
    if @users.save 

      login_user(@users)

      redirect_to root_path
    
  
    else
  
      render "new" , status: :unprocessable_entity
  
    end
  
  end

  private
 
  def permite_params_users 
 
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
 
  end


end
