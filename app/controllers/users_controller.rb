class UsersController < ApplicationController


    #loads the signup page
 def new 
    @user = User.new 
 end

 def index
   @user = User.find_by_id(session[:user_id])
   # redirect_to user_path(@user.id)
  end

 def create 
    #creates a new user if the user saves the session user id will be set to equal the users id and then redirect to the shoe page
    @user = User.new(user_params)
    if @user.save 
        session[:user_id] = @user.id 
        redirect_to users_path
    else 
      # if user doesn't save redirect to sign up
        render :new
    end
 end

 def show 
   @user = User.find_by_id(session[:user_id])
 end 

private 

 def user_params
    params.require(:user).permit(:username, :email, :password)
 end
  

end