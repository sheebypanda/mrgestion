class Facture < ApplicationRecord
  belongs_to :employeur
  has_many :facture_lignes
  has_many :prestations, through: :facture_lignes

  validates_presence_of :numero, :debut, :fin

  def total
    facture_lignes.sum(:montant)
  end

end
