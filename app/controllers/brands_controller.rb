require 'pry'
class BrandsController < ApplicationController
 

  def index 
    @brands = Brand.all 
  end 

  def show
    # binding.pry
    @brand = Brand.find_by(id: params[:id])
    if !@brand
     redirect_to brand_path
    end
  end
end