class Prestation < ApplicationRecord
  belongs_to :employeur
  belongs_to :client
  belongs_to :machine
end
