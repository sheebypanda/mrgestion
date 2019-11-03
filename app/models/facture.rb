class Facture < ApplicationRecord
  belongs_to :employeur
  has_many :facture_lignes, dependent: :destroy
  has_many :prestations, through: :facture_lignes

  validates_presence_of :numero, :debut, :fin
  accepts_nested_attributes_for :facture_lignes

  def total
    self.remise = 0 unless self.remise
    total = 0
    self.prestations.each do |p|
      p.hsups.each do |hs|
        total = hs.qte * 35 + total
      end
    end
    total = total + facture_lignes.sum(:montant) - self.remise
  end

end
