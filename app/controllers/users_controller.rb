class UsersController < ApplicationController


    #loads the signup page
 def new 
    @user = User.new 
 end


 def create 
    #creates a new user if the user saves the session user id will be set to equal the users id and then redirect to the shoe page
    @user = User.new(user_params)
    if @user.save 
        session[:user_id] = @user.id 
        redirect_to shoes_path
    else 
        render :new
    end
 end

private 

 def user_params
    params.require(:user).permit(:username, :email, :password)
 end
  

end