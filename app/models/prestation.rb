class Prestation < ApplicationRecord
  belongs_to :employeur
  belongs_to :client
  belongs_to :machine
  has_many :hsups
  has_many :facture_lignes
  has_many :factures, through: :facture_lignes

  def start_time
    self.debut.to_datetime
  end
  def end_time
    self.fin.to_datetime
  end

end
