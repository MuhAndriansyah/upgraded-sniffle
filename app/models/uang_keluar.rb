class UangKeluar < ApplicationRecord

  def self.search(dari_tanggal, sampai_tanggal)
    self.where("tanggal between ? AND ?", "%#{dari_tanggal}%", "%#{sampai_tanggal}%")
  end
  
end
