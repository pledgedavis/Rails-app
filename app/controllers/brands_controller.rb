require 'pry'
class BrandsController < ApplicationController
    before_action :check_if_logged_in

  def index 
        #line does not execute if params does not contain a shoe_id
    if params[:shoe_id]
      # binding.pry
        @brands = Shoe.find(params[:shoe_id]).brands
      else
    @brands = Brand.order_by_name
    end 
  end

  def show
    
    @brand = Brand.find_by(id: params[:id])
    if !@brand
     redirect_to brand_path
    end
  end
end