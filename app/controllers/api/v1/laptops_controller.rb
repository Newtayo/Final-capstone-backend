class Api::V1::LaptopsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  before_action :set_laptop, only: %i[show update destroy]

  def index
    @laptops = Laptop.all
    render json: @laptops
  end

  def show
    render json: @laptop
  end

  def create
    @laptop = Laptop.new(laptop_params)
    if @laptop.save
      render json: { id: @laptop.id }, status: :created, location: api_v1_laptop_url(@laptop)
    else
      render json: @laptop.errors, status: :unprocessable_entity
    end
  end

  def update
    if @laptop.update(laptop_params)
      render json: @laptop
    else
      render json: @laptop.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def destroy
    if @laptop.nil?
      render json: { error: 'laptop not found' }, status: :not_found
    else
      @laptop.reservations.destroy_all
      @laptop.destroy
      head :no_content
    end
  end

  private

  def set_laptop
    @laptop = Laptop.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'laptop not found' }, status: :not_found
  end

  def laptop_params
    params.require(:laptop).permit(:name, :description, :image_url, :price, :model_year, :rom_size, :ram_size)
  end
end
