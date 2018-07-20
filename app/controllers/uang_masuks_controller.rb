class UangMasuksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_uang_masuk, only: [:edit, :update, :destroy]

  # GET /uang_masuks
  # GET /uang_masuks.json
  def index
    @cari_uang_masuk = UangMasuk.where(["keterangan iLIKE ?","%#{params[:keterangan]}%"]).order(id: :desc)
    @a_masuk = true
  end

  # GET /uang_masuks/1
  # GET /uang_masuks/1.json

  # GET /uang_masuks/new
  def new
    @uang_masuk = UangMasuk.new
  end


  # GET /uang_masuks/1/edit
  def edit
  end

  # POST /uang_masuks
  # POST /uang_masuks.json
  def create
    @uang_masuk = UangMasuk.new(uang_masuk_params)

    respond_to do |format|
      if @uang_masuk.save
        format.html { redirect_to uang_masuks_path, notice: 'Uang masuk was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @uang_masuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uang_masuks/1
  # PATCH/PUT /uang_masuks/1.json
  def update
    respond_to do |format|
      if @uang_masuk.update(uang_masuk_params)
        format.html { redirect_to @uang_masuk, notice: 'Uang masuk was successfully updated.' }
        format.json { render :show, status: :ok, location: @uang_masuk }
      else
        format.html { render :edit }
        format.json { render json: @uang_masuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uang_masuks/1
  # DELETE /uang_masuks/1.json
  def destroy
    @uang_masuk.destroy
    respond_to do |format|
      format.html { redirect_to uang_masuks_url, notice: 'Uang masuk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uang_masuk
      @uang_masuk = UangMasuk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uang_masuk_params
      params.require(:uang_masuk).permit(:jumlah, :tanggal, :keterangan)
    end
end
