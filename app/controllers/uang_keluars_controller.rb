class UangKeluarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_uang_keluar, only: [:edit, :update, :destroy]

  def index
    @cari_uang_keluar = UangKeluar.where(["keterangan iLIKE ?","%#{params[:search]}%"]).order(id: :desc)
    @a_keluar = true
  end

  def new
    @uang_keluar = UangKeluar.new
  end

  def create
    @uang_keluar = UangKeluar.new(uang_keluar_params)
    if @uang_keluar.save
      redirect_to uang_keluars_path
      flash[:notice] = 'Uang Keluar was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @uang_keluar.update(uang_keluar_params)
      redirect_to @uang_keluar
      flash[:notice] = 'Uang Keluar berhasil di updated'
    else
      render :edit
    end
  end

  def destroy
    @uang_keluar.destroy
    redirect_to uang_keluar_url
    flash[:notice] = 'berhasil Dihapus'
  end

  private

  def set_uang_keluar
    @uang_keluar = UangKeluar.find(params[:id])
  end

  def uang_keluar_params
    params.require(:uang_keluar).permit(:jumlah, :tanggal, :keterangan)
  end

end
