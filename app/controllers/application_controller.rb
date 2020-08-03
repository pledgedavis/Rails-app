class ApplicationController < ActionController::Base
    

 def current_user 
   User.find_by[:user_id]
 end

 


end
