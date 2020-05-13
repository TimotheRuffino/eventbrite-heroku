class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:show, :edit, :update]
  #before_action :own_profil

  def index
    @users = User.all
  end

  #def authenticate_user
   # unless current_user
      
    #  redirect_to new_user_session_path
    #end
  #end

  #def own_profil
   # if current_user.id == params[:id]
     
    #  redirect_to new_user_session_path
   # end
  #end

  
  def show
    @events_user = User.find(params[:id]).events
    @users = User.find(params[:id])
        if current_user.id != @users.id
            flash[:error] = "You are not the allowed."
          redirect_to root_path
        end
end

end