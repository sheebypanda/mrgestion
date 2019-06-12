class FactureLigne < ApplicationRecord
  belongs_to :prestation
  belongs_to :facture

  validates_presence_of :debut, :fin
end
