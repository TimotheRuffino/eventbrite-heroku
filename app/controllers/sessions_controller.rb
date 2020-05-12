class SessionsController < ApplicationController
  def destroy
    log_out(current_user)
    flash[:danger] = 'Vous vous êtes déconnectés.'
    redirect_to root_path
  end
end
