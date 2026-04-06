class PagesController < ApplicationController
  layout 'application'

  def index
    @tires = Tire.limit(6)
    @brands = Brand.all
  end

  # Tires actions
  def tires_index
    @tires = Tire.all
  end

  def tires_new
    @tire = Tire.new
    @brands = Brand.all
  end

  def tires_show
    @tire = Tire.find_by(id: params[:id])
    redirect_to tires_path, alert: 'Tire not found' if @tire.nil?
  end

  def tires_edit
    @tire = Tire.find_by(id: params[:id])
    @brands = Brand.all
    redirect_to tires_path, alert: 'Tire not found' if @tire.nil?
  end

  # Brands actions
  def brands_index
    @brands = Brand.all
  end

  def brands_new
    @brand = Brand.new
  end

  def brands_edit
    @brand = Brand.find_by(id: params[:id])
    redirect_to brands_path, alert: 'Brand not found' if @brand.nil?
  end

  # Auth actions
  def register
  end

  def login
  end

  def profile
  end
end
