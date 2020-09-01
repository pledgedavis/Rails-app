class ShoesController < ApplicationController

  def index     
        
    #     byebug
    #    @user = current_user
  end


  def new 
   @shoe = Shoe.new
  end 


  def create 
    @shoe = current_user.shoes.build(shoe_params)
    if @shoe.save 
        redirect_to shoe_path(@shoe)
    else
        render :new 
  end 
end

def show 
   @last_created_shoe = Shoe.last
end 




private 
def shoe_params
    params.require(:shoe).permit(:name, :retail_price, :resale_price, :quality)
 end
  

end