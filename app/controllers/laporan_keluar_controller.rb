class LaporanKeluarController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:dari_tanggal] and params[:sampai_tanggal]
      @data_uang_keluar = search
    else
      @data_uang_keluar = nil
    end
    @a_lpkeluar = true
  end

  def search
    @data_uang_keluar = UangKeluar.search(params[:dari_tanggal], params[:sampai_tanggal])
  end
end
