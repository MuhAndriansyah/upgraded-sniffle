class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @data_uang_masuk = UangMasuk.where("tanggal > ? AND tanggal < ?", Time.now.beginning_of_month, Time.now.end_of_month)
    @data_uang_keluar = UangKeluar.where("tanggal > ? AND tanggal < ?", Time.now.beginning_of_month, Time.now.end_of_month)
    @a_dashboard = true
  end

end
