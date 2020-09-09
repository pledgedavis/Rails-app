class ShoesController < ApplicationController
  before_action :check_if_logged_in
  def index     
    # byebug
    if params[:brand_id] && brand = find_brand 
       @shoes = brands.shoes 
    else
        @shoes = Shoe.ordered
    #     byebug
    #    @user = current_user
     end  
    end


  def new 
#    @shoe = Shoe.new   
  if params[:brand_id] && brand = find_brand
        @shoe = brand.shoes.build
    else 
        @shoe = Shoe.new 
        @shoe.build_brand
    end
  end 


  def edit
  # binding.pry  
  if do_not_match == true
    flash[:error] = "Shoe has to belong to you to be able to edit! "
    redirect_back(fallback_location: shoe_path)
  else
    last_created_shoe
  end    
  end


  def create 
    # binding.pry
    @shoe = current_user.shoes.build(shoe_params)
    if @shoe.save 
        redirect_to shoe_path(@shoe)
    else
        render :new 
  end 
end

def show 
    last_created_shoe
end 

def shoebybrand
  find_brand
    # byebug
end

def update
  last_created_shoe
  if @shoe.update(shoe_params)
    redirect_to shoe_path(@shoe)
  else
    render :edit
  end
end

def destroy
  last_created_shoe
    @shoe.destroy
  redirect_to shoes_path
end


private
def last_created_shoe
    #finds shoe by id and redirects to shoes path if that shoe is false
 @shoe = Shoe.find_by(id: params[:id])
 if !@shoe 
  redirect_to shoes_path
 end
end

def find_brand
  @brand= Brand.find_by(id: params[:brand_id])
end

def do_not_match
  # byebug
  current_user != Shoe.find_by(id: params[:id]).user 
end

def shoe_params
    params.require(:shoe).permit(:name, :retail_price, :resale_price, :quality, brand_attributes:[ :id, :company_name])
 end
end