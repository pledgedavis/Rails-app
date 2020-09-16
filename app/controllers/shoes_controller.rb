class ShoesController < ApplicationController
  before_action :check_if_logged_in
  
  def index     
    if params[:brand_id] && brand = find_brand 
       @shoes = brands.shoes 
    else
        @shoes = Shoe.ordered
     end  
    end


  def new 
    
  if params[:brand_id] && @brand = find_brand
        # @shoe = brand.shoes.build
        @shoe = Shoe.new 
                 @shoe.brand = @brand
    else 
        @shoe = Shoe.new 
        @shoe.build_brand
    end
  end 


  def edit
    flash[:error] = "Shoe has to belong to you to be able to edit! "
    last_created_shoe    
  end


  def create 
    # binding.pry
    # while inside of the nested route shoe_params does not have a brand_id 
    @shoe = current_user.shoes.build(shoe_params)
     # but inside of the nested new form you need the brand_id to match the shoe your creating because without it there is no brand 
    @shoe.brand = Brand.find_by_id(params[:brand_id]) if params[:brand_id]
   #If shoe is not save through unnested route searches for brand_id to allow route to be nested
    if @shoe.save 
        redirect_to shoe_path(@shoe)
        #saves created nested or unnested shoe then redirects to it's show page
    else
        render :new 
  end 
end

def show 
    last_created_shoe
end 

def shoebybrand
  find_brand
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
    #finds shoe by id and redirects to (all_shoes)shoes path if that shoe is false
    # binding.pry
 @shoe = Shoe.find_by(id: params[:id])
if !@shoe.brand_id
    @shoe.delete
  flash[:error] = "Shoe has to have a brand!"
    redirect_to new_shoe_path
elsif !@shoe 
  redirect_to shoes_path
 end
end

def find_brand
  @brand= Brand.find_by(id: params[:brand_id])
end

def shoe_params
    params.require(:shoe).permit(:name, :retail_price, :resale_price, :size, :brand_id, brand_attributes:[ :id, :company_name])
 end
end