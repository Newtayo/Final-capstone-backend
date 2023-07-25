class LaptopsController < ApplicationController
  before_action :set_laptop, only: %i[show edit update destroy]

  # GET /laptops or /laptops.json
  def index
    @laptops = Laptop.all
    render json: @laptops
  end

  # GET /laptops/1 or /laptops/1.json
  def show; end

  # GET /laptops/new
  def new
    @laptop = Laptop.new
  end

  # GET /laptops/1/edit
  def edit; end

  # POST /laptops or /laptops.json
  def create
    @laptop = Laptop.new(laptop_params)
    if @laptop.save
      
      render json: { message: 'Laptop has been created successfully!', laptop_obj: @laptop }, status: :created
    else
      Rails.logger.error("Laptop creation failed: #{laptop_params}")
      Rails.logger.error("Validation errors: #{@laptop.errors.full_messages}")
      render json: { errors: @laptop.errors.full_messages, message: 'Laptop couldn\'t be created.' }, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /laptops/1 or /laptops/1.json
  def update
    respond_to do |format|
      if @laptop.update(laptop_params)
        format.html { redirect_to laptop_url(@laptop), notice: 'Laptop was successfully updated.' }
        format.json { render :show, status: :ok, location: @laptop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @laptop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laptops/1 or /laptops/1.json
  def destroy
    @laptop.destroy

    respond_to do |format|
      format.html { redirect_to laptops_url, notice: 'Laptop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_laptop
    @laptop = Laptop.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def laptop_params
    params.require(:laptop).permit(:name, :description,:photo_url, :model_year, :price, :rom_size, :ram_size)
  end
end
