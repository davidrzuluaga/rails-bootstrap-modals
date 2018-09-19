class UsersController < ApplicationController

  def invite_friend
    to_email = params[:email]
    from_email = current_user.email
    UserMailer.create_invite(from_email, to_email, Time.now).deliver_now
  end

  def authentication
    user = User.find_by_email(params[:email])
    if  user.valid_password?(params[:password])
      render json: { token: user.auth_token }
    end  
  end
#exponer un endpoint authentication que reciba el usuario y el password de un usuario y retorne el token
end