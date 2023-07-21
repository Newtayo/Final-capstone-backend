class Api::V1::LaptopsController < ApplicationController
  index
    @laptops = Laptop.all
    render json: @laptops
  end

  def create
    @laptop = Laptop.new(laptop_params)
    if @laptop.valid?
      @laptop.save
      render json: { message: 'Laptop has been created successfully!', laptop_obj: @laptop }, status: :created
    else
      render json: { message: 'Laptop couldn\'t be created.' }, status: :not_acceptable
    end
  end

  def destroy
    id = params[:id]
    @laptop = Laptop.find(id)

    if @laptop
      @laptop.destroy
      render json: { message: 'Laptop has been destroyed successfully!' }, status: :ok
    else
      render json: { message: 'Something went wrong.' }, status: :not_found
    end
  end

  private

  def laptop_params
    params.require(:laptop).permit(:name, :description, :photo_url, :model_year, :price, :rom_size, :ram_size)
  end
end
