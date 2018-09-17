class UsersController < ApplicationController
  def invite_friend
    to_email = params[:email]
    from_email = current_user.email
    UserMailer.create_invite(from_email, to_email, Time.now).deliver_now
  end
end
