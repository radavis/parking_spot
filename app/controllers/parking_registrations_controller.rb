class ParkingRegistrationsController < ApplicationController
  before_action :set_parking_registration, only: [:show, :edit, :update, :destroy]

  # GET /parking_registrations
  # GET /parking_registrations.json
  def index
    @parking_registrations = ParkingRegistration.all
  end

  # GET /parking_registrations/1
  # GET /parking_registrations/1.json
  def show
    @parking_registration = ParkingRegistration.find(params[:id])
  end

  # GET /parking_registrations/new
  def new
    @parking_registration = ParkingRegistration.new
  end

  # GET /parking_registrations/1/edit
  def edit
  end

  # POST /parking_registrations
  # POST /parking_registrations.json
  def create
    @parking_registration = ParkingRegistration.new(parking_registration_params)

    if @parking_registration.park
      flash[:notice] = 'You registered successfully.'
      redirect_to "/parking_registrations/#{@parking_registration.id}"
    else
      render :new
    end

    # respond_to do |format|
    #   if @parking_registration.save
    #     format.html { redirect_to @parking_registration, notice: 'You registered successfully.' }
    #     format.json { render action: 'show', status: :created, location: @parking_registration }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @parking_registration.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /parking_registrations/1
  # PATCH/PUT /parking_registrations/1.json
  def update
    respond_to do |format|
      if @parking_registration.update(parking_registration_params)
        format.html { redirect_to @parking_registration, notice: 'Parking registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parking_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_registrations/1
  # DELETE /parking_registrations/1.json
  def destroy
    @parking_registration.destroy
    respond_to do |format|
      format.html { redirect_to parking_registrations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_registration
      @parking_registration = ParkingRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_registration_params
      params.require(:parking_registration).permit(:first_name, :last_name, :email, :spot_number, :parked_on)
    end
end
