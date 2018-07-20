class LaporanMasukController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:dari_tanggal] and params[:sampai_tanggal]
      @data_uang_masuk = search
    else
      @data_uang_masuk = nil
    end
    @a_laporan = true
  end

  def search
    @uang = UangMasuk.search(params[:dari_tanggal], params[:sampai_tanggal])
  end
end
